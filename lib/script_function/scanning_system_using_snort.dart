import 'dart:convert';
import 'dart:io';

import 'package:cyber_shield/pages_provider/system_scanning_provider.dart';
import 'package:cyber_shield/share_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../pages_provider/app_graph_data_provider.dart';

class ScanningSystemUsingSnort {

  static  Future<void> scan(BuildContext context) async{
    try {
      final process = await Process.start('sudo', ['-S', 'bash', "/home/chandan/flutter project/cyber_shield/lib/scripts/snort_scanning.sh"], runInShell: true);
      final password = await SharePreferences.getPassword();
      process.stdin.writeln(password);
      process.stdin.writeln('y');
      await process.stdin.flush();
      await process.stdin.close();
      // Handle process output and input as needed.
      process.stdout.transform(utf8.decoder).listen((data) {
        Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        // Provider.of<SystemScanningProvider>(context,listen: false).addScanningData(data);
        Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
      });
      // final exitCode = await process.exitCode;
    } catch (e) {
      print('Error running script');
    }
  }
}
