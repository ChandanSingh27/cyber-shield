import 'dart:io';

import 'package:flutter/cupertino.dart';

class SnortRuleFile {
  String fileName;
  String filePath;
  SnortRuleFile({required this.fileName,required this.filePath});
}
class AppDrawerAddedRulePageProvider with ChangeNotifier {

  List<SnortRuleFile> snortRuleFileList = [];
  String localFilePath = "/etc/snort/rules/local.rules";

  PageController ruleFilePageController = PageController();
  String fileContent = "";

  updateFileContent(String content,int page) {
    fileContent = content;
    ruleFilePageController.jumpToPage(page);
    notifyListeners();
  }


  addNewRuleFile(SnortRuleFile ruleFile) {
    snortRuleFileList.add(ruleFile);
    // notifyListeners();
  }



  getRuleFiles() async{
    Directory dic = Directory("/etc/snort/rules/");
    if( await dic.exists()) {
      List<FileSystemEntity> files = dic.listSync();
      for (var element in files) {
        List<String> names = element.path.split('/');
        String fileName = names[names.length-1];
        addNewRuleFile(SnortRuleFile(fileName: fileName, filePath: element.path));
      }
    }
  }

  getLogFiles() {
    Directory dic = Directory("/var/log/snort/snort.alert.fast");
    List<FileSystemEntity> files = dic.listSync();
    for (var element in files) {
      List<String> names = element.path.split('/');
      String fileName = names[names.length-1];
      addNewRuleFile(SnortRuleFile(fileName: fileName, filePath: element.path));
    }
  }
}