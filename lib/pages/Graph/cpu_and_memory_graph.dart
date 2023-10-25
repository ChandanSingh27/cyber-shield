import 'package:cyber_shield/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../pages_provider/app_graph_data_provider.dart';

class CpuAndMemoryUtilizationGraph extends StatefulWidget {
  const CpuAndMemoryUtilizationGraph({super.key});

  @override
  State<CpuAndMemoryUtilizationGraph> createState() => _CpuAndMemoryUtilizationGraphState();
}

class _CpuAndMemoryUtilizationGraphState extends State<CpuAndMemoryUtilizationGraph> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppGraphDataProvider>(
      builder: (context, graphDataProvider, child) =>
          Stack(
            children: [
              SfCartesianChart(
                legend: const Legend(
                  height: "70%",
                  width: "100%",
                  padding: 3,
                  isVisible: true,
                  title: LegendTitle(text: "Graph Info",textStyle: TextStyle(color: Colors.white,),alignment: ChartAlignment.near),
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(color: Colors.white,fontSize: 12)
                ),
                crosshairBehavior: CrosshairBehavior(
                  enable: true,
                  activationMode: ActivationMode.singleTap
                ),
                enableAxisAnimation: true,
                enableSideBySideSeriesPlacement: true,
                title: ChartTitle(text: "CPU Utilization Graph",textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor),alignment: ChartAlignment.far),
                primaryYAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(
                      width: 0,
                      color: Colors.transparent
                    ),
                    minimum: 0,
                    maximum: 100,
                    title: AxisTitle(
                        text: "Cpu Usage in Percentage",
                        textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6))
                    ),
                    labelFormat: "{value} %"
                ),
                primaryXAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(
                      width: 0,
                      color: Colors.transparent
                  ),
                  maximum: 60,
                  minimum: 0,
                  title: AxisTitle(
                      text: "Time in Second",
                      textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6)),
                  ),
                  labelFormat: "{value} S"
                ),
                series: <SplineSeries>[
                  SplineSeries<CpuCoreStructure,double>(
                    color: Colors.blue,
                    width: 2,
                    dataSource: graphDataProvider.cpuCoreUsageList,
                    xValueMapper: (datum, index) => datum.yTimes,
                    yValueMapper: (datum, index) => datum.cpuCoreList[0],
                    legendItemText: "CPU 1",
                  ),
                  SplineSeries<CpuCoreStructure,double>(
                      color: Colors.red,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[1],
                    legendItemText: "CPU 2"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>3)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.green,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[2],
                      legendItemText: "CPU 3"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>4)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.orange,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[3],
                      legendItemText: "CPU 4"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>5)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.grey,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[4],
                      legendItemText: "CPU 5"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>6)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.white,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[5],
                      legendItemText: "CPU 6"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>7)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.brown,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[6],
                      legendItemText: "CPU 7"
                  ),
                  if(graphDataProvider.cpuCoreUsageList.length>=8)SplineSeries<CpuCoreStructure,double>(
                      color: Colors.deepPurple,
                      width: 2,
                      dataSource: graphDataProvider.cpuCoreUsageList,
                      xValueMapper: (datum, index) => datum.yTimes,
                      yValueMapper: (datum, index) => datum.cpuCoreList[7],
                      legendItemText: "CPU 8"
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                  child: FloatingActionButton(onPressed: (){},child: Icon(Icons.select_all),))
            ],
          ),
    );
  }
}
