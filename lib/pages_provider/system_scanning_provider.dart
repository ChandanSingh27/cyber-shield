import 'package:flutter/material.dart';

class SystemScanningProvider with ChangeNotifier {
  List<String> scriptOutput = [];

  ScrollController listViewController = ScrollController();
  
  addDataIntoScriptOutPutList(String data) {
    scriptOutput.add(data);
    listViewController.animateTo(listViewController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }
}