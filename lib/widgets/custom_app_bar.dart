import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_info2/system_info2.dart';

import '../constant/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Ionicons.person_circle_outline,size: 40,color: Colors.blue,),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hey, ${SysInfo.userName}"??"Hey Buddy",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryFontColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Operating System: ${SysInfo.operatingSystemName}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.primaryLightColor),),
                Text("Version: ${SysInfo.operatingSystemVersion}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.primaryLightColor),),
                // Text("Kernel Architecture: ${SysInfo.kernelArchitecture}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.primaryLightColor),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

