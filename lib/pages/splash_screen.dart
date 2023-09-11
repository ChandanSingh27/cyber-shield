import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cyber_shield/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'app_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Ionicons.shield_half_outline,size: 65,color: Colors.blue,),
            const SizedBox(width: 20,),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Cyber Shield',
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    color: AppColors.primaryLightColor,
                    fontWeight: FontWeight.bold,
                  ),
                  cursor: "_",
                  speed: const Duration(milliseconds: 500),
                ),
              ],

              onFinished: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AppHomePage())),
              repeatForever: false,
              isRepeatingAnimation: false,
            )
          ],
        ),
      ),
    );
  }
}
