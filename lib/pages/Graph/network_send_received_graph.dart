import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/colors.dart';
import '../../pages_provider/app_graph_data_provider.dart';

class NetworkSendReceivedPacketGraph extends StatefulWidget {
  const NetworkSendReceivedPacketGraph({super.key});

  @override
  State<NetworkSendReceivedPacketGraph> createState() => _NetworkSendReceivedPacketGraphState();
}

class _NetworkSendReceivedPacketGraphState extends State<NetworkSendReceivedPacketGraph> {
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
              title: ChartTitle(text: "Network Utilization Graph",textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor),alignment: ChartAlignment.far),
              primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(
                      width: 0,
                      color: Colors.transparent
                  ),
                  minimum: 50,
                  maximum: 1000,
                  title: AxisTitle(
                      text: "Memory Usage in Percentage",
                      textStyle: TextStyle(fontSize: 18,color: AppColors.primaryLightColor.withOpacity(0.6))
                  ),
                  labelFormat: "{value} KiB/s"
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
                SplineSeries<NetworkStructure,double>(
                  color: Colors.blue,
                  width: 6,
                  dataSource: graphDataProvider.networkUsageList,
                  xValueMapper: (datum, index) => datum.yTimes,
                  yValueMapper: (datum, index) => datum.recevied,
                  legendItemText: "Receiving",
                ),
                SplineSeries<NetworkStructure,double>(
                    color: Colors.red,
                    width: 3,
                    dataSource: graphDataProvider.networkUsageList,
                    xValueMapper: (datum, index) => datum.yTimes,
                    yValueMapper: (datum, index) => datum.send,
                    legendItemText: "Sending"
                ),
              ],
            );
          }
      ),
    );
  }
}
