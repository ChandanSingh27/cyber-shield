import 'dart:async';
import 'package:cyber_shield/pages/drawer_pages/drawerAddRulePage.dart';
import 'package:cyber_shield/pages/drawer_pages/drawerHelpPage.dart';
import 'package:cyber_shield/pages/drawer_pages/drawerHomePage.dart';
import 'package:cyber_shield/pages/drawer_pages/drawerScanningPage.dart';
import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:cyber_shield/pages_provider/app_home_page_provider.dart';
import 'package:cyber_shield/script_function/checking_root_password_method.dart';
import 'package:cyber_shield/script_function/scanning_system_using_snort.dart';
import 'package:cyber_shield/script_function/script_useful_method.dart';
import 'package:cyber_shield/share_preference.dart';
import 'package:cyber_shield/widgets/app_drawer.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:system_info2/system_info2.dart';
import '../constant/colors.dart';
import '../pages_provider/app_drawer_add_added_rule_page_provider.dart';
import '../script_function/adding_new_local_rules.dart';
import '../shortcut_key.dart';
import '../widgets/custom_app_bar.dart';
import 'drawer_options_screen_lists.dart';
import 'drawer_pages/drawerLogFilesPage.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {

  final passwordController = TextEditingController();
  SmartDialogController smartDialogController = SmartDialogController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkTheUserPassword();
    Provider.of<AppDrawerAddedRulePageProvider>(context,listen: false).getRuleFiles();
    getCpuUsages(context);
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: shortcutsKey,
        child: Actions(
          actions: shortKeyActions(context),
          child: Focus(
            autofocus: true,
            child: Scaffold(
              backgroundColor: Color(0xff000000),
              // backgroundColor: AppColors.primaryLightColor,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const AppDrawer(),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CustomAppBar(),
                              Expanded(
                                  child: Consumer<AppDrawerProvider>(
                                    builder: (context, appDrawerProvider, child) =>
                                        PageView(
                                          controller: appDrawerProvider.screenController,
                                          physics: const NeverScrollableScrollPhysics(),
                                          children: screensList,
                                        ),
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: (){
              //     ElegantNotification.info(
              //         title:  Text("Alert Detected",style: TextStyle(color: AppColors.primaryLightColor),),
              //         description:  Text("This account will be updated ",style: TextStyle(color: AppColors.primaryLightColor)),
              //       background: const Color(0xff212025),
              //       width: 400,
              //       notificationPosition: NotificationPosition.bottomRight,
              //       progressIndicatorBackground: Colors.white,
              //     ).show(context);
              //   },
              // ),
            ),
          ),
        ));
  }

  checkTheUserPassword() async{
    String? password = await SharePreferences.getPassword();
    if(password == null) {
       getUserComputerPassword(context);
    }else{
      RootPassword.runRootCheckingMethod(context: context, scriptPath: "/home/chandan/flutter project/cyber_shield/lib/scripts/installation_script.sh",password: password).then((value){
        if(value){
          return;
        }else{
          getUserComputerPassword(context);
        }
      });
    }
  }
  getCpuUsages(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ScriptUseFulMethods.cpuUsageMethod(
          context: context,
          scriptPath:
              "/home/chandan/flutter project/cyber_shield/lib/scripts/cpuUsage.sh");
    });
  }

  getUserComputerPassword(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SmartDialog.show(
      controller: smartDialogController,
      clickMaskDismiss: false,

      // onDismiss: () => scanningProvider.toggleStopFullCpuUsageScanning(true),
      builder: (context) => Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(20),
        width: 500,
        height: 250,
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.21))
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
                top: -90,
                left: 155,
                child: CircleAvatar(backgroundColor: Colors.blue,radius: 70,child: Icon(Ionicons.person_outline,size: 40,),)),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30,),
                  Text(
                    "Hey, ${SysInfo.userName}"??"Hey Buddy",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryFontColor,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Consumer<AppHomePageProvider>(builder: (context, provider, child) => TextField(
                    controller: passwordController,
                    autofocus: true,
                    obscureText: !provider.isPasswordVisible,
                    obscuringCharacter: "X",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: AppColors.ebonyColor,
                        hintStyle: const TextStyle(color: Colors.grey,fontSize: 15,),
                        hintText: "Your root password",
                        suffixIcon: GestureDetector(
                          onTap: provider.toggleThePasswordVisible,
                            child: Icon(provider.isPasswordVisible ? Ionicons.eye_off : Ionicons.eye)),
                    ),
                    style: TextStyle(fontSize: 15,color: AppColors.primaryLightColor),
                    onSubmitted: (value) {
                      SharePreferences.setPassword(password: value);
                      SmartDialog.dismiss();
                      checkTheUserPassword();
                    },
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
