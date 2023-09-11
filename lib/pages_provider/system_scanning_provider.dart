import 'dart:async';

import 'package:flutter/material.dart';

import '../script_function/script_useful_method.dart';

class SystemScanningProvider with ChangeNotifier {

  bool stopFullCpuUsageScanning = true;

  List<String> scriptOutput = [];

  List<String> fullCpuUsageList = [];

  ScrollController listViewController = ScrollController();
  ScrollController fullCpuUsageLogListViewController = ScrollController();

  toggleStopFullCpuUsageScanning(bool value) {
    stopFullCpuUsageScanning = value;
    notifyListeners();
  }
  addDataIntoScriptOutPutList(String data) {
    scriptOutput.add(data);
    listViewController.animateTo(listViewController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  addDataIntoFullCpuUsageList(String data) {
    fullCpuUsageList.add(data);
    print(data);
    fullCpuUsageLogListViewController.animateTo(fullCpuUsageLogListViewController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  void getFullCpuUsageData(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(stopFullCpuUsageScanning){
        timer.cancel();
        notifyListeners();
      }else{
        ScriptUseFulMethods.fullCpuUsageMethod(context: context, scriptPath: "/home/chandan/flutter project/cyber_shield/lib/scripts/full_cpu_utilization.sh");
        notifyListeners();
      }
    });
  }
}