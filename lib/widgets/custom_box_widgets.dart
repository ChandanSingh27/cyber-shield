import 'package:cyber_shield/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UtilizationWidgets extends StatefulWidget {
  String title;
  String subTitle;
  double usages;
  Color? iconColor = AppColors.lightShadeGreen;
  UtilizationWidgets({super.key,required this.title,required this.subTitle,required this.usages,this.iconColor});

  @override
  State<UtilizationWidgets> createState() => _UtilizationWidgetsState();
}

class _UtilizationWidgetsState extends State<UtilizationWidgets> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      height: size.height * 0.15,
      width: size.width * 0.22,
      decoration: BoxDecoration(
          color: const Color(0xff212025),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurStyle: BlurStyle.outer,
              blurRadius: 5,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
              Icon(CupertinoIcons.graph_square,color: AppColors.lightShadeGreen,)
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.subTitle,style: const TextStyle(fontSize: 15,color: Colors.white),),
              Flexible(child: Text("${widget.usages.ceil().toString()}%"??"0",style: TextStyle(color: widget.usages < 70 ? Colors.greenAccent : Colors.redAccent ,overflow: TextOverflow.ellipsis),))
            ],
          ),
        ],
      ),
    );
  }
}
