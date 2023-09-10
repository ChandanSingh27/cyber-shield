import 'package:cyber_shield/pages/Graph/memory_graph.dart';
import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:cyber_shield/widgets/custom_box_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../Graph/cpu_and_memory_graph.dart';

class DrawerDashBoard extends StatefulWidget {
  const DrawerDashBoard({super.key});

  @override
  State<DrawerDashBoard> createState() => _DrawerDashBoardState();
}

class _DrawerDashBoardState extends State<DrawerDashBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Analytics Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.primaryLightColor),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Consumer<AppGraphDataProvider>(builder: (context, appGraphDataProvider, child) => UtilizationWidgets(title: "Cpu Utilization",subTitle: "cpu usages:",usages: appGraphDataProvider.cpuUsageList.isNotEmpty ?appGraphDataProvider.cpuUsageList[appGraphDataProvider.cpuUsageList.length-1].xCpuUsages : 0),),
              const SizedBox(width: 10,),
              UtilizationWidgets(title: "Memory Utilization",subTitle: "memory usages:",usages: 20,iconColor: AppColors.lightShadeRed),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade700.withOpacity(0.5),width: 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        color: Colors.white.withOpacity(0.5),
                      )
                    ],
                    color: const Color(0xff212025),
                ),
                child: const CpuAndMemoryUtilizationGraph(),
              ))
        ],
      ),
    );
  }
}
