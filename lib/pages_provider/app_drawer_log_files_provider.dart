import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDrawerLogFilesProvider with ChangeNotifier {
  DateTime now = DateTime.now();
  String selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  selectDate(DateTime dateTime) {
    selectedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    notifyListeners();
  }

  String selectedTime = "${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour < 12 ? "AM" : "PM"}";
  selectTme(TimeOfDay timeOfDay) {
    selectedTime = "${timeOfDay.hour}:${timeOfDay.minute} ${timeOfDay.hour < 12 ? "AM" : "PM"}";
    notifyListeners();
  }
  List<String> daysList = ["Yesterday","Today","Tomorrow"];
  String selectedDay = "Today";
  selectDay(String day) {
    selectedDay = day;
    notifyListeners();
  }
}