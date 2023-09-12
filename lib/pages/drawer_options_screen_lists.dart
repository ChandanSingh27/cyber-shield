
import 'package:cyber_shield/pages/drawer_pages/drawerLogFilesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_pages/drawerAddRulePage.dart';
import 'drawer_pages/drawerHelpPage.dart';
import 'drawer_pages/drawerHomePage.dart';
import 'drawer_pages/drawerScanningPage.dart';

List<Widget> screensList = [
  const DrawerDashBoard(),
  const DrawerScanningPage(),
  const DrawerLogFilesPage(),
  const DrawerAddedRulePage(),
  Container(
    color: Colors.black,
  ),
  DrawerHelpPage(),
];