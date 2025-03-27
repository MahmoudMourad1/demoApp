import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:user/utils/extentions/extention.dart';

class ExpansionWidget extends StatelessWidget {
  final String title;
  final Widget expansionWidget;
  const ExpansionWidget({super.key,required this.title,required this.expansionWidget});

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        


        boxShadow: [
          BoxShadow(
            color: Color(0x56EBDDC0),
            blurRadius: 12.70,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: ExpansionTile(

        initiallyExpanded: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF2EDE2)),
          borderRadius: BorderRadius.circular(14),
        ),


        clipBehavior: Clip.none,
        title: Text(title,
          style: AppTextStyle.font18black400,),
        children: [
          Divider(
            color: Color(0xFFD7E6EE),
            thickness: 1.h,
          ),
          10.hs,
          expansionWidget
        ],
        backgroundColor:Constants.isDark?AppColor.containerColor: Color(0xFFFFF9ED),
        collapsedBackgroundColor:Constants.isDark?AppColor.containerColor: Color(0xFFFFF9ED),
        iconColor: AppColor.black,
        collapsedIconColor: AppColor.black,
      ),
    );
  }
}
