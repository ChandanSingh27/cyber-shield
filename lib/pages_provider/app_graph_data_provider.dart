import 'package:flutter/cupertino.dart';

class CpuUsageStructure {
  double xidle;
  double yTimes;
  double ioWait;
  double sys;
  double user;
  CpuUsageStructure({required this.xidle, required this.yTimes,required this.ioWait,required this.sys,required this.user});
}
class AppGraphDataProvider with ChangeNotifier {
  List<CpuUsageStructure> cpuUsageList = [];
  double cpu = 0;

  incrementCpu() {
    if(cpu>99){
      cpu = 0;
      notifyListeners();
    }else{
      cpu++;
      notifyListeners();
    }
  }
  addDataIntoCpuUsageList (CpuUsageStructure cpuUsageStructure) {
    cpuUsageList.add(cpuUsageStructure);
    if(cpuUsageStructure.yTimes == 59) cpuUsageList.clear();
    notifyListeners();
  }
}