import 'package:cyber_shield/pages/Graph/memory_graph.dart';
import 'package:cyber_shield/pages/Graph/network_send_received_graph.dart';
import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:cyber_shield/widgets/custom_box_widgets.dart';
import 'package:cyber_shield/widgets/frosted_glass.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AppGraphDataProvider>(builder: (context, appGraphDataProvider, child) => UtilizationWidgets(networkWidget: false,title: "Cpu Utilization",subTitle: "cpu usages:",usages: appGraphDataProvider.cpuCoreUsageList.isNotEmpty ? appGraphDataProvider.cpuCoreUsageList[appGraphDataProvider.cpuCoreUsageList.length-1].cpuCoreList[0] : 0,borderColor: appGraphDataProvider.selectedGraph == 0?Colors.blue:Colors.transparent,onTap: () => appGraphDataProvider.clickSelectedGraph(0),),),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
              Consumer<AppGraphDataProvider>(
                builder: (context, appGraphDataProvider, child) {
                  return UtilizationWidgets(networkWidget: false,title: "Memory Utilization",subTitle: "memory usages:",usages: appGraphDataProvider.memoryUsageList.isNotEmpty ? appGraphDataProvider.memoryUsageList[appGraphDataProvider.memoryUsageList.length-1].memory : 0,iconColor: AppColors.lightShadeRed,subTitle1: "swap memory usage",usages1: appGraphDataProvider.memoryUsageList.isNotEmpty ? appGraphDataProvider.memoryUsageList[appGraphDataProvider.memoryUsageList.length-1].swap_memory : 0,borderColor: appGraphDataProvider.selectedGraph == 1?Colors.blue:Colors.transparent,onTap: () => appGraphDataProvider.clickSelectedGraph(1),);
                }
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
              Consumer<AppGraphDataProvider>(
                  builder: (context, appGraphDataProvider, child) {
                    return UtilizationWidgets(title: "Network Utilization",subTitle: "Receiving ↓ :",subTitle1: "Sending ↑ :",usages: appGraphDataProvider.networkUsageList.isNotEmpty ? appGraphDataProvider.networkUsageList[appGraphDataProvider.networkUsageList.length-1].recevied:0, usages1: appGraphDataProvider.networkUsageList.isNotEmpty ? appGraphDataProvider.networkUsageList[appGraphDataProvider.networkUsageList.length-1].send:0,iconColor: AppColors.lightShadeRed,borderColor: appGraphDataProvider.selectedGraph == 2 ? Colors.blue:Colors.transparent,onTap: () => appGraphDataProvider.clickSelectedGraph(2),networkWidget: true,);}
              ),
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
                        color: Colors.white.withOpacity(0.2),
                      )
                    ],
                    // color: const Color(0xff212025),
                    color: Colors.transparent
                ),
                child: Consumer<AppGraphDataProvider>(
                  builder: (context, appGraphDataProvider, child) {
                    return PageView(
                      controller: appGraphDataProvider.graphController,
                      children: const [
                        CpuAndMemoryUtilizationGraph(),
                        MemoryStageGraph(),
                        NetworkSendReceivedPacketGraph()
                      ],
                    );
                  }
                ),
              ))
        ],
      ),
    );
  }
}
