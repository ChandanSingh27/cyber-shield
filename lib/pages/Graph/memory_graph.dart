import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        builder:(context, dataProvider, child) {
          return Container();
        }
      ),
    );
  }
}
