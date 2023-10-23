import 'dart:io';

import 'package:cmd_plus/cmd_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../pages_provider/app_drawer_log_files_provider.dart';

class DrawerLogFilesPage extends StatefulWidget {
  const DrawerLogFilesPage({super.key});

  @override
  State<DrawerLogFilesPage> createState() => _DrawerLogFilesPageState();
}

class _DrawerLogFilesPageState extends State<DrawerLogFilesPage> {
  List<String> daysList = ["Yesterday","Today","Tomorrow"];
  String contents = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  readData() async {
    File file = File("/var/log/snort/snort.alert.fast");
    if(await file.exists()) contents = file.readAsStringSync();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff212025),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade700.withOpacity(0.5),width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 5,),
          searchBar(size),
          // Text(contents,style: const TextStyle(color: Colors.white),),
          const SizedBox(height: 10,),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                return Text("ajsn");
              },),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

getRuleFiles() async{
  Directory dic = Directory("/etc/snort/rules/");
  if( await dic.exists()) {
    List<FileSystemEntity> files = dic.listSync();
    for (var element in files) {
      if(element is Directory) {
        
      }
      List<String> names = element.path.split('/');
      String fileName = names[names.length-1];
    }
  }
}

class Struct {
  String name;
  bool isDictory;

  Struct(this.name, this.isDictory);
}
Widget searchBar(Size size){
  return Container(
    width: size.width * 0.36,
    height: 45,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: const Color(0xff000000),
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              color: Colors.white.withOpacity(0.2)
          )
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade700.withOpacity(0.5), width: 1)),
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: AppColors.secondaryFontColor,
          ),
          hintText: "Search log files",
          hintStyle: TextStyle(color: AppColors.secondaryFontColor),
          contentPadding: const EdgeInsets.only(bottom: 10, left: 10)),
      style: TextStyle(color: AppColors.primaryLightColor),
      cursorColor: Colors.blue,
    ),
  );
}

/*
Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              searchBar(size),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Days:",style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.6)),),
                  const SizedBox(height: 10,),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade700.withOpacity(0.7))
                    ),
                    child: Consumer<AppDrawerLogFilesProvider>(
                      builder: (context, logFileProvider, child) => DropdownButtonFormField2(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          isDense: false,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        // isExpanded: true,
                        hint: Text(
                          'Select Days',
                          style: TextStyle(fontSize: 14,color: AppColors.primaryLightColor),
                        ),
                        items: logFileProvider.daysList.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                            style: TextStyle(fontSize: 14,color: AppColors.primaryLightColor),
                          ),
                        )).toList(),
                        onChanged: (value) {
                          if(value != null)logFileProvider.selectDay(value);
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 60,
                          padding: EdgeInsets.only(left: 5, right: 5),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white30,
                          ),
                          iconSize: 30,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: AppColors.ebonyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Date:",style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.6)),),
                  const SizedBox(height: 10,),
                  Consumer<AppDrawerLogFilesProvider>(builder: (context, logFileProvider, child) => Container(
                    width: 200,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade700.withOpacity(0.7))
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(logFileProvider.selectedDate.toString(),style: TextStyle(color: AppColors.primaryLightColor),),
                        GestureDetector(
                          onTap: () async{
                            final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime.now(),builder: (context, child) {
                            return Theme(data: ThemeData.light().copyWith(
                              primaryColor: Colors.blue, // Color of the selected date
                              hintColor: Colors.blue,
                              datePickerTheme: DatePickerThemeData(
                                backgroundColor:AppColors.ebonyColor,
                                dayStyle: const TextStyle(color: Colors.white),
                                headerBackgroundColor: Colors.blue,
                                shadowColor: Colors.white.withOpacity(0.2)
                              ),
                              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                              colorScheme: const ColorScheme.light(primary: Colors.blue).copyWith(onSurface: Colors.white),
                            ), child: child!,);
                          },);
                            if(date != null)logFileProvider.selectDate(date);
                          },
                          child: Icon(Icons.date_range,color: AppColors.primaryLightColor,),
                        )
                      ],
                    ),
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Time:",style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.6)),),
                  const SizedBox(height: 10,),
                  Consumer<AppDrawerLogFilesProvider>(builder: (context, logFileProvider, child) => Container(
                    width: 200,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade700.withOpacity(0.7))
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(logFileProvider.selectedTime.toString(),style: TextStyle(color: AppColors.primaryLightColor),),
                        GestureDetector(
                          onTap: () async{
                            final time = await showTimePicker(context: context, initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),builder: (context, child) => Theme(
                              data: ThemeData(
                                  primaryColor: Colors.blue, // Color of the selected date
                                  hintColor: Colors.blue,
                                  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                  colorScheme: ColorScheme.dark().copyWith(
                                    onSurface: Colors.white,
                                    onBackground: AppColors.ebonyColor,
                                    onPrimary: Colors.blue,
                                    background: AppColors.ebonyColor
                                )
                              ),
                              child: child!,
                            ),);
                            if(time != null) logFileProvider.selectTme(time);
                          },
                          child: Icon(CupertinoIcons.clock,color: AppColors.primaryLightColor,),
                        )
                      ],
                    ),
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Days:",style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.6)),),
                  const SizedBox(height: 10,),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade700.withOpacity(0.7))
                    ),
                    child: Consumer<AppDrawerLogFilesProvider>(
                      builder: (context, logFileProvider, child) => DropdownButtonFormField2(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          isDense: false,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        // isExpanded: true,
                        hint: Text(
                          'Select Days',
                          style: TextStyle(fontSize: 14,color: AppColors.primaryLightColor),
                        ),
                        items: logFileProvider.daysList.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                            style: TextStyle(fontSize: 14,color: AppColors.primaryLightColor),
                          ),
                        )).toList(),
                        onChanged: (value) {
                          if(value != null)logFileProvider.selectDay(value);
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 60,
                          padding: EdgeInsets.only(left: 5, right: 5),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white30,
                          ),
                          iconSize: 30,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: AppColors.ebonyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 50,),
          RichText(
            text: TextSpan(
              text: "This is a long string with the words 'hello' and 'world'.",
              children: [
                TextSpan(
                  text: "hello",
                  style: TextStyle(color: Colors.red),
                  recognizer: TapGestureRecognizer()..onTap = () => print("hello"),
                ),
              ],
            ),
          )
        ],
      )
 * */
