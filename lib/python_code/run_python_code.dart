import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../pages_provider/app_graph_data_provider.dart';

class RunPythonCode {
  static void runCpuUtilization(BuildContext context,String pythonFilePath) async {

    final process = await Process.start('python3', [pythonFilePath],runInShell: true);

    process.stdout.transform(utf8.decoder).listen((data) {
      DateTime now = DateTime.now();
      double time = double.tryParse(now.second.toString())!;
      // Provider.of<AppGraphDataProvider>(context,listen: false).addDataIntoCpuUsageList(returnCpuUsage(data),time);
      List<double> dataList = data.substring(1, data.length - 2) // Remove the square brackets
          .split(', ') // Split the string into a list of strings
          .map((value) => double.parse(value)) // Convert each string to a double
          .toList();
      Provider.of<AppGraphDataProvider>(context,listen: false).addDataIntoCpuCoreUsageList(CpuCoreStructure(dataList, time));
      // print('Python stdout: $data');
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      print('Python stderr: $data');
    });

    final exitCode = await process.exitCode;
    // print('Python process exited with code $exitCode');
  }
  static void runMemoryUtilization(BuildContext context,String pythonFilePath) async {

    final process = await Process.start('python3', [pythonFilePath],runInShell: true);

    process.stdout.transform(utf8.decoder).listen((data) {
      DateTime now = DateTime.now();
      double time = double.tryParse(now.second.toString())!;
      List<double> dataList = data.substring(1, data.length - 2) // Remove the square brackets
          .split(', ') // Split the string into a list of strings
          .map((value) => double.parse(value)) // Convert each string to a double
          .toList();
      Provider.of<AppGraphDataProvider>(context,listen: false).addDataIntoMemoryUsageList(MemoryStructure(dataList[0], dataList[1], time));
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      print('Python stderr: $data');
    });

    final exitCode = await process.exitCode;
    // print('Python process exited with code $exitCode');
  }

  static void runNetworkUtilization(BuildContext context,String pythonFilePath) async {

    final process = await Process.start('python3', [pythonFilePath],runInShell: true);

    process.stdout.transform(utf8.decoder).listen((data) {
      DateTime now = DateTime.now();
      double time = double.tryParse(now.second.toString())!;
      List<String> dataList = data.substring(1, data.length - 2).split(', '); // Split the string into a list of strings
      List<double> finalData  = dataList[0].split(",").map((value) => double.parse(value)).toList();
      Provider.of<AppGraphDataProvider>(context,listen: false).addDataIntoNetworkUsageList(NetworkStructure(finalData[0], finalData[1], time));
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      print('Python stderr: $data');
    });

    final exitCode = await process.exitCode;
    // print('Python process exited with code $exitCode');
  }

  static void sendEmail(BuildContext context,String pythonFilePath,String data) async {
    final process = await Process.start('python3', [pythonFilePath],runInShell: true);
    process.stdin.writeln(data);
    process.stdin.writeln('y');
    await process.stdin.flush();
    await process.stdin.close();
    process.stdout.transform(utf8.decoder).listen((data) {
      print(data);
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      print('Python stderr: $data');
    });

    final exitCode = await process.exitCode;
    // print('Python process exited with code $exitCode');
  }
}