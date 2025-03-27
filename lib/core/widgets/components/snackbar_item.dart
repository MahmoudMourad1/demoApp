
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/text_style.dart';

void showCustomSnackBar(String message, {bool isError = false, bool getXSnackBar = false, int seconds = 3,required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.horizontal,
    margin:  EdgeInsets.all(13.w),
    duration: Duration(seconds: seconds),
    backgroundColor: isError ? Colors.red : Colors.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    content: Text(message, style: AppTextStyle.font14blue400.copyWith(color: Colors.white)),
  ));
}
