
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cyber_shield/pages/app_home_page.dart';
import 'package:cyber_shield/pages/splash_screen.dart';
import 'package:cyber_shield/pages_provider/app_drawer_log_files_provider.dart';
import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:cyber_shield/pages_provider/app_graph_data_provider.dart';
import 'package:cyber_shield/pages_provider/system_scanning_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppDrawerProvider(),),
        ChangeNotifierProvider(create: (context) => SystemScanningProvider(),),
        ChangeNotifierProvider(create: (context) => AppDrawerLogFilesProvider(),),
        ChangeNotifierProvider(create: (context) => AppGraphDataProvider(),)
      ],
      child: const CyberShield()));
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1400, 900);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Cyber Shield";
    win.show();
  });
}

class CyberShield extends StatelessWidget {
  const CyberShield({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const SplashScreen()
    );
  }
}

