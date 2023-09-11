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
            crosshairBehavior: CrosshairBehavior(
              enable: true,
              activationMode: ActivationMode.doubleTap
            ),
            trackballBehavior: TrackballBehavior(
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
                  text: "Time in Milisecond",
                  textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6)),
              ),
              labelFormat: "{value} S"
            ),
            series: <SplineSeries>[
              SplineSeries<CpuUsageStructure,double>(
                color: Colors.blue,
                dataSource: graphDataProvider.cpuUsageList,
                xValueMapper: (datum, index) => datum.yTimes,
                yValueMapper: (datum, index) => datum.xidle,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  color: Colors.white
                )
              ),
              SplineSeries<CpuUsageStructure,double>(
                  color: Colors.red,
                  dataSource: graphDataProvider.cpuUsageList,
                  xValueMapper: (datum, index) => datum.yTimes,
                  yValueMapper: (datum, index) => datum.ioWait,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: Colors.red
                  )
              ),
              SplineSeries<CpuUsageStructure,double>(
                  color: Colors.green,
                  dataSource: graphDataProvider.cpuUsageList,
                  xValueMapper: (datum, index) => datum.yTimes,
                  yValueMapper: (datum, index) => datum.sys,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: Colors.red
                  )
              ),
              SplineSeries<CpuUsageStructure,double>(
                  color: Colors.orange,
                  dataSource: graphDataProvider.cpuUsageList,
                  xValueMapper: (datum, index) => datum.yTimes,
                  yValueMapper: (datum, index) => datum.user,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: Colors.red
                  )
              ),
            ],
          ),
    );
  }
}
