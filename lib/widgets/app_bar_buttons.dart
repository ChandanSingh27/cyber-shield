import 'package:cyber_shield/constant/colors.dart';
import 'package:flutter/material.dart';
class AppBarButton extends StatefulWidget {
  String buttonName;
  IconData buttonIcon;
  VoidCallback onTap;
  AppBarButton({super.key,required this.buttonName,required this.buttonIcon,required this.onTap});

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: Row(
          children: [
            Icon(widget.buttonIcon,color: isHover ? AppColors.primaryFontColor : AppColors.secondaryFontColor ,size: 26,),
            const SizedBox(width: 5,),
            Text(widget.buttonName,style: TextStyle(fontSize: 16,color: isHover ? AppColors.primaryFontColor : AppColors.secondaryFontColor),),
          ],
        ),
      ),
    );
  }
}
