import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../share_preference.dart';

class PermissionOnLocalRuleFiles {
  static  Future<void> permission(BuildContext context) async{
    try {
      final process = await Process.start('sudo', ['-S', 'bash', "/home/chandan/flutter project/cyber_shield/lib/scripts/adding_local_rule.sh"], runInShell: true);
      final password = await SharePreferences.getPassword();
      await process.stdin.flush();
      process.stdin.writeln(password);
      // process.stdin.writeln('y');
      // Handle process output and input as needed.
      process.stdout.transform(utf8.decoder).listen((data) {
        // Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
        print("success $data");
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        // Provider.of<SystemScanningProvider>(context,listen: false).addScanningData(data);
        // Provider.of<SystemScanningProvider>(context,listen: false).addDataIntoScriptOutPutList(data);
        print("error $data");
      });
      await process.stdin.close();
      // final exitCode = await process.exitCode;
    } catch (e) {
      print('Error running script');
    }
  }
}