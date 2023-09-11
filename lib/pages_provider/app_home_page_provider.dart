import 'package:flutter/cupertino.dart';

class AppHomePageProvider with ChangeNotifier {

  bool isPasswordVisible = false;

  toggleThePasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

}