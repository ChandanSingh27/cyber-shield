import 'package:flutter/cupertino.dart';

class CpuUsageStructure {
  double xCpuUsages;
  double yTimes;
  CpuUsageStructure(this.xCpuUsages,this.yTimes);
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
  addDataIntoCpuUsageList (double data,double time) {
    cpuUsageList.add(CpuUsageStructure(100-data, time));
    notifyListeners();
  }
}