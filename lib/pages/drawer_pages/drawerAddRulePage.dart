import 'dart:io';

import 'package:cyber_shield/pages_provider/app_drawer_add_added_rule_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../script_function/adding_new_local_rules.dart';

class DrawerAddedRulePage extends StatefulWidget {
  const DrawerAddedRulePage({super.key});

  @override
  State<DrawerAddedRulePage> createState() => _DrawerAddedRulePageState();
}

class _DrawerAddedRulePageState extends State<DrawerAddedRulePage> {

  TextEditingController ruleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Snort Rules File",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.primaryLightColor,),),
              GestureDetector(
                onTap: (){
                  PermissionOnLocalRuleFiles.permission(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.add,color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Add Custom Rule",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: const Color(0xff212025),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade700.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Consumer<AppDrawerAddedRulePageProvider>(
              builder: (context, ruleFileProvider, child) {
                return PageView(
                  controller: ruleFileProvider.ruleFilePageController,
                  children: [
                    (ruleFileProvider.snortRuleFileList.isNotEmpty) ? ListView.builder(
                      itemCount: ruleFileProvider.snortRuleFileList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            File file = File(ruleFileProvider.snortRuleFileList[index].filePath);
                            String contents = file.readAsStringSync();
                            ruleFileProvider.updateFileContent(contents,1);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            child: Text(ruleFileProvider.snortRuleFileList[index].fileName,style: const TextStyle(color: Colors.white),),
                          ),
                        );
                      },) : const Center(child: Text("No File Exists",style: TextStyle(color: Colors.white,fontSize: 18),),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          ruleFileProvider.updateFileContent("", 0);
                        }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.transparent,
                            child: SingleChildScrollView(child: Text(ruleFileProvider.fileContent,style: TextStyle(color: Colors.white.withOpacity(0.8)),)),
                          ),
                        ),
                      ],
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
