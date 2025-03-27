import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/extentions/extention.dart';

class AppCheckBox2 extends StatefulWidget {
  const AppCheckBox2(
      {super.key,
        required this.onChanged,
        required this.value,
        required this.title,
        this.onTitlePressed});

  final Function(bool?)? onChanged;
  final bool value;
  final String title;
  final VoidCallback? onTitlePressed;

  @override
  State<AppCheckBox2> createState() => _AppCheckBox2State();
}

class _AppCheckBox2State extends State<AppCheckBox2> {
  // bool _isSelected=false;
  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap: (){

        // setState(() {
        //   _isSelected= !_isSelected;
        // });
        // if (widget.onChanged != null) {
          widget.onChanged?.call(!(widget.value ?? false));
        // }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.black,width: 1),
                shape: BoxShape.circle
            ),
            child: CircleAvatar(radius: 6.w,backgroundColor: widget.value?AppColor.black:Colors.transparent,),
          ),
          8.ws,
          Text(widget.title,style: AppTextStyle.font16black400,),
        ],
      ),
    );
  }
}
