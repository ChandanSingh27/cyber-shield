import 'package:flutter/material.dart';

class AppDrawerProvider with ChangeNotifier {

  int selectedNavItem = 0;

  final screenController = PageController(initialPage: 0);

  bool isDrawerOpen = true;
  double drawerWidth = 300;

  openCloseDrawer() {
    if(isDrawerOpen) {
      isDrawerOpen = false;
      drawerWidth = 100;
    }else{
      isDrawerOpen = true;
      drawerWidth = 300;
    }
    notifyListeners();
  }

  changeSelectedNavItem(int navId) {
    selectedNavItem = navId;
    screenController.jumpToPage(navId);
    notifyListeners();
  }
}