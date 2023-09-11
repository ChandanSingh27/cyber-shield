import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class RootPassword {

  static Future<bool> runRootCheckingMethod({required BuildContext context,required String scriptPath,required String password}) async {
    try {
      final process = await Process.start(
          'sudo', ['-S', 'bash', scriptPath], runInShell: true);
      process.stdin.writeln(password);
      process.stdin.writeln('y');
      await process.stdin.flush();
      // Handle process output and input as needed.
      process.stdout.transform(utf8.decoder).listen((data) {
        return;
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        return;
      });
      await process.stdin.close();
      final exitCode = await process.exitCode;
      if(exitCode == 1) {
        print(exitCode);
        return false;
      }else{
        return true;
      }
    } catch (e) {
      print('Error running script ${e.toString()}');
    }
    return false;
  }

}