import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class IssueListItem extends StatefulWidget {
  const IssueListItem({super.key});

  @override
  State<IssueListItem> createState() => _IssueListItemState();
}

class _IssueListItemState extends State<IssueListItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        height: size.height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isHover? AppColors.ebonyColor : AppColors.primaryColor,
        ),
        child: ListTile(
          title: Text("Title",style: TextStyle(
            fontSize: 15,
            color: AppColors.primaryFontColor,
          ),),
          subtitle: Text(
            "This is subtitle",
            style: TextStyle(
              fontSize: 15,
              color: AppColors.secondaryFontColor,
            ),
          ),
          leading: const Icon(Icons.error,color: Colors.white,size: 30),
          trailing: const Icon(CupertinoIcons.chevron_right,color: Colors.white,),
        ),
      ),
    );
  }
}
