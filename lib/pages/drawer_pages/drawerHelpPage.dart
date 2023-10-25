import 'package:cyber_shield/const_value.dart';
import 'package:cyber_shield/constant/colors.dart';
import 'package:cyber_shield/python_code/run_python_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DrawerHelpPage extends StatefulWidget {
  const DrawerHelpPage({super.key});

  @override
  State<DrawerHelpPage> createState() => _DrawerHelpPageState();
}

class _DrawerHelpPageState extends State<DrawerHelpPage> {

  TextEditingController queryController = TextEditingController();
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
      floatingActionButton: GestureDetector(
        onTap: () => SmartDialog.show(builder: (context) {
          return Container(
            width: 500,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color:const Color(0xff212025),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade700.withOpacity(0.5))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Write your problem",style: TextStyle(fontSize: 18,color: Colors.white),),
                const SizedBox(height: 5,),
                const Text("We will investigate your problem and get back to you as soon as we have a solution.",style: TextStyle(fontSize: 13,color: Colors.white70),),
                const SizedBox(height: 10,),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: queryController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        hintText: "write your query here..."
                    ),
                    style: const TextStyle(color: Colors.grey,fontSize: 15),
                  ),
                ),
                const SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        SmartDialog.dismiss();
                        if(queryController.text.isNotEmpty)RunPythonCode.sendEmail(context, "/home/chandan/flutter project/cyber_shield/lib/python_code/send_email.py", queryController.text.toString());
                        queryController.clear();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 15),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue
          ),
          child: const Text("Report",style: TextStyle(color: Colors.white,),),
        ),
      )
    );
  }
}
