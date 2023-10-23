import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/colors.dart';

class MemoryStageGraph extends StatefulWidget {
  const MemoryStageGraph({super.key});

  @override
  State<MemoryStageGraph> createState() => _MemoryStageGraphState();
}

class _MemoryStageGraphState extends State<MemoryStageGraph> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      height: size.height * 0.15,
      width: size.width * 0.22,
      child: Consumer<AppGraphDataProvider>(
        builder:(context, graphDataProvider, child) {
          return SfCartesianChart(
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
            title: ChartTitle(text: "Memory Utilization Graph",textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor),alignment: ChartAlignment.far),
            primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(
                    width: 0,
                    color: Colors.transparent
                ),
                minimum: 0,
                maximum: 100,
                title: AxisTitle(
                    text: "Memory Usage in Percentage",
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
              SplineSeries<MemoryStructure,double>(
                color: Colors.blue,
                width: 2,
                dataSource: graphDataProvider.memoryUsageList,
                xValueMapper: (datum, index) => datum.yTimes,
                yValueMapper: (datum, index) => datum.memory,
                legendItemText: "Memory",
              ),
              SplineSeries<MemoryStructure,double>(
                  color: Colors.green,
                  width: 2,
                  dataSource: graphDataProvider.memoryUsageList,
                  xValueMapper: (datum, index) => datum.yTimes,
                  yValueMapper: (datum, index) => datum.swap_memory,
                  legendItemText: "Swap"
              ),
            ],
          );
        }
      ),
    );
  }
}
