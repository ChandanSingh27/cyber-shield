import 'package:cyber_shield/constant/colors.dart';
import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconWithTextButton extends StatefulWidget {
  int id;
  bool hideText;
  IconData buttonIcons;
  String buttonName;
  IconWithTextButton({super.key,required this.id,required this.hideText,required this.buttonIcons, required this.buttonName});

  @override
  State<IconWithTextButton> createState() => _IconWithTextButtonState();
}

class _IconWithTextButtonState extends State<IconWithTextButton> {

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: Consumer<AppDrawerProvider>(
        builder: (context, appDrawerProvider, child) => GestureDetector(
          onTap: () => appDrawerProvider.changeSelectedNavItem(widget.id),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(left: 12,right: 12,top: 20) ,
            padding:  const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: widget.id == appDrawerProvider.selectedNavItem ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(5)
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.buttonIcons,color: widget.id == appDrawerProvider.selectedNavItem ? Colors.white : Colors.white,size: 30,),
                const SizedBox(width: 5,),
                if(widget.hideText) Text(widget.buttonName,style: TextStyle(fontSize: 17,color: widget.id == appDrawerProvider.selectedNavItem ? Colors.white : Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
