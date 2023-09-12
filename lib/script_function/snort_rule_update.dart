import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../pages_provider/system_scanning_provider.dart';
import '../share_preference.dart';

class SnortRuleUpdation {

  static  Future<void> scan(BuildContext context) async{
    try {
      final process = await Process.start('sudo', ['-S', 'bash', "/home/chandan/flutter project/cyber_shield/lib/scripts/rule_update.sh"], runInShell: true);
      final password = await SharePreferences.getPassword();
      process.stdin.writeln(password);
      process.stdin.writeln('y');
      // Handle process output and input as needed.
      process.stdout.transform(utf8.decoder).listen((data) {
        Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        // print("error  =>>>> $data");
        // Provider.of<SystemScanningProvider>(context,listen: false).addScanningData(data);
        Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
      });
      await process.stdin.flush();
      await process.stdin.close();
      // final exitCode = await process.exitCode;
    } catch (e) {
      print('Error running script');
    }
  }
}