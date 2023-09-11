import 'dart:async';

import 'package:cyber_shield/constant/colors.dart';
import 'package:cyber_shield/pages_provider/system_scanning_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../script_function/script_useful_method.dart';
class UtilizationWidgets extends StatefulWidget {
  String title;
  String subTitle;
  double usages;
  Color? iconColor = AppColors.lightShadeGreen;
  UtilizationWidgets({super.key,required this.title,required this.subTitle,required this.usages,this.iconColor});

  @override
  State<UtilizationWidgets> createState() => _UtilizationWidgetsState();
}

class _UtilizationWidgetsState extends State<UtilizationWidgets> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: size.height * 0.15,
        // width: size.width * 0.22,
        decoration: BoxDecoration(
            // color: const Color(0xff212025),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade700.withOpacity(0.5),width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                Icon(CupertinoIcons.graph_square,color: AppColors.lightShadeGreen,)
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.subTitle,style: const TextStyle(fontSize: 15,color: Colors.white),),
                Flexible(child: Text("${widget.usages.ceil().toString()}%"??"0",style: TextStyle(color: widget.usages < 70 ? Colors.greenAccent : Colors.redAccent ,overflow: TextOverflow.ellipsis),))
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<SystemScanningProvider>(builder: (context, scanningProvider, child) => TextButton(onPressed: (){
                  scanningProvider.toggleStopFullCpuUsageScanning(false);
                  scanningProvider.getFullCpuUsageData(context);
                  SmartDialog.show(
                    onDismiss: () => scanningProvider.toggleStopFullCpuUsageScanning(true),
                    builder: (context) => Container(
                      margin: const EdgeInsets.all(50),
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: const Color(0xff000000).withOpacity(0.9),
                          // color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.21))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cpu Utilization Log",style: TextStyle(color: Colors.blue,fontSize: 20),),
                          const SizedBox(height: 10,),
                          Flexible(child: Consumer<SystemScanningProvider>(
                            builder: (context, scanning, child) => ListView.builder(
                              controller: scanning.fullCpuUsageLogListViewController,
                              shrinkWrap: true,
                              itemCount: scanning.fullCpuUsageList.length,itemBuilder: (context, index) => SelectableText(scanning.fullCpuUsageList[index],style: TextStyle(color: AppColors.primaryLightColor.withOpacity(0.5)),),),
                          )),
                          Align(alignment: Alignment.bottomRight,child: Consumer<SystemScanningProvider>(builder: (context, scanning, child) => FloatingActionButton(onPressed: (){
                            if(scanningProvider.stopFullCpuUsageScanning){
                              scanningProvider.toggleStopFullCpuUsageScanning(false);
                              scanningProvider.getFullCpuUsageData(context);
                            }else{
                              scanningProvider.toggleStopFullCpuUsageScanning(true);
                            }
                          },child: Icon(scanning.stopFullCpuUsageScanning ? Ionicons.play : Ionicons.pause)),),)
                        ],
                      ),
                    ),
                  );
                }, child: const Text("View Full Report"),),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
