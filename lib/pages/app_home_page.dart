import 'dart:async';
import 'package:cyber_shield/pages/drawer_pages/drawerHomePage.dart';
import 'package:cyber_shield/pages/drawer_pages/drawerScanningPage.dart';
import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:cyber_shield/script_function/script_useful_method.dart';
import 'package:cyber_shield/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../constant/colors.dart';
import '../pages_provider/app_graph_data_provider.dart';
import '../shortcut_key.dart';
import '../widgets/custom_app_bar.dart';
import 'drawer_pages/drawerLogFilesPage.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List<Widget> screensList = [
    const DrawerDashBoard(),
    const DrawerScanningPage(),
    Container(
      color: Colors.red,
    ),
    const DrawerLogFilesPage(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.grey,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            ),
          ),
        ));
  }

  getCpuUsages(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ScriptUseFulMethods.cpuUsageMethod(
          context: context,
          scriptPath:
              "/home/chandan/flutter project/cyber_shield/lib/scripts/cpuUsage.sh");
    });
  }
}
