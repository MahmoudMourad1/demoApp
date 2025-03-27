import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {super.key,
        required this.onChanged,
        required this.value,
        required this.title,
         this.widgetTitle,
         this.isCircle=false,

        this.onTitlePressed});

  final ValueChanged<bool?>? onChanged;
  final bool? value;
  final bool? isCircle;
  final String title;
  final Widget? widgetTitle;
  final VoidCallback? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onChanged?.call(!(value ?? false));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.w,

            child: Checkbox(

                side: const BorderSide(color: AppColor.gray3, width: 2),
                checkColor: AppColor.white,
                activeColor: AppColor.black,
                shape: isCircle!=null?CircleBorder():RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),

                value: value,
                onChanged: onChanged),
          ),
          if (onTitlePressed != null)
            TextButton(
                onPressed:onTitlePressed,
                child:widgetTitle!=null?(widgetTitle!): Text(title,
                    style: AppTextStyle.font15black400,))
          else ...{8.ws, widgetTitle!=null?(widgetTitle!):Text(title, style:  AppTextStyle.font15black400,)}
        ],
      ),
    );
  }
}
