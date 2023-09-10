import 'dart:convert';
import 'dart:io';
import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:cyber_shield/pages_provider/system_scanning_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScriptUseFulMethods {

  static Future<void> runScriptAsSuperuser({required BuildContext context,required String scriptPath}) async {
    try {
      final process = await Process.start(
          'sudo', ['-S', 'bash', scriptPath], runInShell: true);
      // Provide the superuser password.
      final password = '057580';
      process.stdin.writeln(password);
      process.stdin.writeln('y');
      await process.stdin.flush();
      await process.stdin.close();
      process.stdout.transform(utf8.decoder).listen((data) {
        Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        print(data);
      });
      // final exitCode = await process.exitCode;
    } catch (e) {
      print('Error running script');
    }
  }

  static double returnCpuUsage(String data) {
    double cpuUsage = 0;
    // Split the data into lines.
    List<String> lines = data.split('\n');
    // Get the data from the last column.
    for (String line in lines) {
      List<String> columns = line.split(' ');
      String idle = columns[columns.length - 1];
      double? parsedDouble = double.tryParse(idle);
      if (parsedDouble != null) cpuUsage = parsedDouble;
    }
    return cpuUsage;
  }

  static Future<void> cpuUsageMethod({required BuildContext context,required String scriptPath}) async {
    try {
      final process = await Process.start(
          'sudo', ['-S', 'bash', scriptPath], runInShell: true);
      // Provide the superuser password.
      final password = '057580';
      process.stdin.writeln(password);
      process.stdin.writeln('y');
      await process.stdin.flush();
      await process.stdin.close();
      // Handle process output and input as needed.
      process.stdout.transform(utf8.decoder).listen((data) {
        DateTime now = DateTime.now();
        int  min = now.minute;
        int  sec = now.second;
        String minOrSecond = "$min.$sec";
        double time = double.tryParse(minOrSecond)!;
        Provider.of<AppGraphDataProvider>(context,listen: false).addDataIntoCpuUsageList(returnCpuUsage(data),time);
      });
      process.stderr.transform(utf8.decoder).listen((data) {

      });
      // final exitCode = await process.exitCode;
    } catch (e) {
      print('Error running script');
    }
  }

}