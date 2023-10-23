import 'package:flutter/cupertino.dart';

class CpuCoreStructure {
  List<double> cpuCoreList;
  double yTimes;

  CpuCoreStructure(this.cpuCoreList, this.yTimes);
}

class MemoryStructure {
  double memory;
  double swap_memory;
  double yTimes;
  MemoryStructure(this.memory, this.swap_memory, this.yTimes);
}

class NetworkStructure {
  double recevied;
  double send;
  double yTimes;
  NetworkStructure(this.recevied, this.send, this.yTimes);
}

class AppGraphDataProvider with ChangeNotifier {

  List<CpuCoreStructure> cpuCoreUsageList = [];
  List<MemoryStructure> memoryUsageList = [];
  List<NetworkStructure> networkUsageList = [];

  int selectedGraph = 0;

  PageController graphController = PageController(initialPage: 0);

  clickSelectedGraph(int page){
    selectedGraph = page;
    graphController.jumpToPage(page);
    notifyListeners();
  }

  addDataIntoCpuCoreUsageList(CpuCoreStructure coreStructure) {
    cpuCoreUsageList.add(coreStructure);
    if(coreStructure.yTimes == 59) cpuCoreUsageList.clear();
    notifyListeners();
  }

  addDataIntoMemoryUsageList(MemoryStructure memoryStructure) {
    memoryUsageList.add(memoryStructure);
    if(memoryStructure.yTimes == 59) memoryUsageList.clear();
    notifyListeners();
  }

  addDataIntoNetworkUsageList(NetworkStructure networkStructure) {
    networkUsageList.add(networkStructure);
    if(networkStructure.yTimes == 59) networkUsageList.clear();
    notifyListeners();
  }

  // addDataIntoCpuUsageList (CpuUsageStructure cpuUsageStructure) {
  //   cpuUsageList.add(cpuUsageStructure);
  //   if(cpuUsageStructure.yTimes == 59) cpuUsageList.clear();
  //   notifyListeners();
  // }
}