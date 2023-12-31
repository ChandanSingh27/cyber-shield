
import 'dart:async';

import 'package:cyber_shield/pages_provider/system_scanning_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../script_function/scanning_system_using_snort.dart';
import '../../script_function/script_useful_method.dart';
import '../../script_function/snort_rule_update.dart';

class DrawerScanningPage extends StatefulWidget {
  const DrawerScanningPage({super.key});

  @override
  State<DrawerScanningPage> createState() => _DrawerScanningPageState();
}

class _DrawerScanningPageState extends State<DrawerScanningPage> with AutomaticKeepAliveClientMixin{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ScriptUseFulMethods.installRequiredTools(context: context, scriptPath: "/home/chandan/flutter project/cyber_shield/lib/scripts/installation_script.sh");
    // SnortRuleUpdation.scan(context);
    ScanningSystemUsingSnort.scan(context);

  }


  @override
  Widget build(BuildContext context) {
    return Consumer<SystemScanningProvider>(builder: (context, data, child) => Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          // color: const Color(0xff212025),
          color: Colors.transparent,
          border: Border.all(color: Colors.grey.shade700.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
              child: const Row(
                children: [
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.blue,),
                  Text("Terminal",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          )),
          Flexible(
            child: Consumer<SystemScanningProvider>(
              builder: (context, scanningProvider, child) => ListView.builder(
                controller: scanningProvider.terminalController,
                itemCount: scanningProvider.scriptOutput.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Text(scanningProvider.scriptOutput[index],style: TextStyle(color: Colors.white.withOpacity(0.7)),),),
            ),
          ),
        ],
      ),
    ),);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
