import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  Widget child;
  FrostedGlass({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent
      ),
      child: Stack(
        children: [
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 40))
        ],
      ),
    );
  }
}
