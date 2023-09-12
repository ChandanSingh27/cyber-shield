import 'package:cyber_shield/const_value.dart';
import 'package:cyber_shield/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DrawerHelpPage extends StatefulWidget {
  const DrawerHelpPage({super.key});

  @override
  State<DrawerHelpPage> createState() => _DrawerHelpPageState();
}

class _DrawerHelpPageState extends State<DrawerHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: const Color(0xff212025),
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade700.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30)
        ),
        child: ListView(
          children: [
            Text("Documentation ✍️",style: TextStyle(color: AppColors.primaryLightColor,fontSize: 18),),
            const SizedBox(height: 20,),
            Text(
              ConstValue.header,style: const TextStyle(color: Colors.white),
            ),
            Text(
              ConstValue.content,style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        SmartDialog.show(builder: (context) {
          return Container(
            width: 500,
            height: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Write your problem",style: TextStyle(fontSize: 18),),
                const SizedBox(height: 5,),
                Text("We will investigate your problem and get back to you as soon as we have a solution.",style: TextStyle(fontSize: 13,color: Colors.black54),),
                TextField(
                  decoration: InputDecoration(
                  ),
                ),
              ],
            ),
          );
        },);
      },child: const Icon(Icons.add),)
    );
  }
}
