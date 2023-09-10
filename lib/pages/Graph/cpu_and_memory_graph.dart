import 'package:cyber_shield/constant/colors.dart';
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
          SfCartesianChart(
            enableAxisAnimation: true,
            enableSideBySideSeriesPlacement: true,
            title: ChartTitle(text: "CPU Utilization Graph",textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor),alignment: ChartAlignment.far),
            primaryXAxis: NumericAxis(
                majorGridLines: const MajorGridLines(
                  width: 0,
                  color: Colors.transparent
                ),
                minimum: 0,
                maximum: 100,
                title: AxisTitle(
                    text: "Cpu Usage in Percentage",
                    textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6))
                )
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(
                  width: 0,
                  color: Colors.transparent
              ),
              maximum: 60,
              minimum: 1,
              title: AxisTitle(
                  text: "Time in Second",
                  textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6))
              ),
            ),
            series: <SplineSeries>[
              SplineSeries<CpuUsageStructure,double>(
                color: Colors.blue,
                dataSource: graphDataProvider.cpuUsageList,
                xValueMapper: (datum, index) => datum.xCpuUsages,
                yValueMapper: (datum, index) => datum.yTimes,
              ),
              SplineSeries<CpuUsageStructure,double>(
                color: Colors.red,
                dataSource: graphDataProvider.cpuUsageList,
                xValueMapper: (datum, index) => datum.yTimes,
                yValueMapper: (datum, index) => datum.xCpuUsages,
              ),
            ],
          ),
    );
  }
}
