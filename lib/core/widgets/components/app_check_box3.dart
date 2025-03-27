import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class AppCheckBox3 extends StatelessWidget {
  const AppCheckBox3(
      {super.key,
        required this.onChanged,
        required this.value,
        required this.title,
        this.isSpacer=false,
        this.onTitlePressed});

  final ValueChanged<bool?>? onChanged;
  final bool? value;
  final bool isSpacer;
  final String title;
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
      child: Directionality(
        textDirection:(context.languageCode=='en'&&isSpacer)? TextDirection.rtl:TextDirection.ltr,
        child: Row(
          mainAxisAlignment:isSpacer? MainAxisAlignment.spaceBetween:MainAxisAlignment.start,

          children: [
            SizedBox(
              width: 20.w,
              child: Checkbox(
                  side: const BorderSide(color: AppColor.gray3, width: 2),
                  checkColor: AppColor.white,
                  activeColor: AppColor.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: value,
                  onChanged: onChanged),
            ),

            if (onTitlePressed != null)
              TextButton(
                  onPressed:onTitlePressed,
                  child: Text(title,
                    style: AppTextStyle.font15black400,))
            else ...{8.ws, Text(title, style:  AppTextStyle.font15black400,)}
          ],
        ),
      ),
    );
  }
}
