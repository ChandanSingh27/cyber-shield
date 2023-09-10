import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/colors.dart';

class NetworkScanningSection extends StatefulWidget {
  const NetworkScanningSection({super.key});

  @override
  State<NetworkScanningSection> createState() => _NetworkScanningSectionState();
}

class _NetworkScanningSectionState extends State<NetworkScanningSection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Network Scanning...", style: TextStyle(
          fontSize: 20,
          color: AppColors.secondaryFontColor,
        )),
        const SizedBox(height: 20,),
        Container(
          alignment: Alignment.center,
          width: size.width * 0.7,
          height: size.height * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondaryColor,
          ),
          child: Lottie.asset("assets/scanning_lottie.json"),
        )
      ],
    );
  }
}
