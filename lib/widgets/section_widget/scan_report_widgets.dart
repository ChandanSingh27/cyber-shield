import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../issue_list_item.dart';

class ScanReportSection extends StatefulWidget {
  const ScanReportSection({super.key});

  @override
  State<ScanReportSection> createState() => _ScanReportSectionState();
}

class _ScanReportSectionState extends State<ScanReportSection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Hey Buddy!",style: TextStyle(
          fontSize: 35,
          color: AppColors.secondaryFontColor,
        ),),
        Text("Welcome Back",style: TextStyle(
          fontSize: 35,
          color: AppColors.primaryFontColor,
        ),),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: size.height * 0.7,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Issue Detected",style: TextStyle(
                fontSize: 15,
                color: AppColors.secondaryFontColor,
              ),),
              const SizedBox(height: 5,),
              Text("Solve the issue to get full recover",style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryFontColor,
              ),),
              Expanded(child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const IssueListItem(),))
            ],
          ),
        )
      ],
    );
  }
}
