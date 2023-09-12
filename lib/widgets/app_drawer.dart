import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'custom_button/icon_with_text_button.dart';
class AppDrawer extends StatefulWidget {

  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppDrawerProvider>(builder: (context, appDrawerProvider, child) => Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          // margin: const EdgeInsets.only(right: 20,left: 10,top: 10,bottom: 10),
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.only(top: 30),
          width: appDrawerProvider.drawerWidth,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: const Color(0xff212025),
              color: Colors.transparent,
            // color: AppColors.matteBlackColor,
              border: Border.all(color: Colors.grey.shade700.withOpacity(0.5),width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconWithTextButton(id: 0,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.laptop_outline, buttonName: "System"),
                  IconWithTextButton(id: 1,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.scan_outline, buttonName: "Scanning"),
                  // IconWithTextButton(id: 2,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.flash_outline, buttonName: "Ports"),
                  IconWithTextButton(id: 2,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.file_tray_full_outline, buttonName: "Log Files"),
                  IconWithTextButton(id: 3,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.construct_outline, buttonName: "Added Ruled"),
                  IconWithTextButton(id: 4,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.alert_outline, buttonName: "Alert"),
                  IconWithTextButton(id: 5,hideText: appDrawerProvider.isDrawerOpen, buttonIcons: Ionicons.help_outline, buttonName: "Help"),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Ionicons.shield_half_outline,color: Colors.blue,size: 40,),
                    const SizedBox(width: 5,),
                    if(appDrawerProvider.isDrawerOpen) const Text("Cyber Shield",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          right: 1,
          child: GestureDetector(
            onTap: appDrawerProvider.openCloseDrawer,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              // backgroundColor: AppColors.lightShadeBlue,
              child: Center(child: Icon(appDrawerProvider.isDrawerOpen ? Icons.arrow_back_ios_new_rounded :Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)),
            ),
          ),
        )
      ],
    ),);
  }


}
