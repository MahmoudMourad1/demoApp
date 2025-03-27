import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:user/utils/extentions/extention.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final VoidCallback? onPressed;
  final double? horizontalTitleGap;
  final bool disable;
  final Color color;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;
  final double borderRaduis;
  final double? width;
  final double? height;
  final BoxBorder? border;

  const AppButton({
    super.key,
    this.title,
    this.leading,
    this.width,
    this.height,
    this.border,
    this.onPressed,
    this.titleStyle,
    this.horizontalTitleGap,
    this.borderRaduis=28.0,
    this.disable = false,  this.textStyle, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?? double.infinity,
      height: height??null,
      child: Container(
        decoration: BoxDecoration(
          border: border,
          color: color,
          borderRadius: BorderRadius.circular(28),
          boxShadow: Constants.isDark?[]:[
            // BoxShadow(
            //      color: AppColor.rose.withOpacity(0.4),
            //    offset: const Offset(
            //      5.0,
            //      5.0,
            //    ),
            //    blurRadius: 10.0,
            //    spreadRadius: 1.3,
            // ),
          ]
        ),
        child: ElevatedButton(

            onPressed: onPressed ?? () {},
            style: ButtonStyle(
                fixedSize:
                MaterialStatePropertyAll(Size(double.infinity, 40.h)),
                shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                surfaceTintColor:
                const MaterialStatePropertyAll(Colors.transparent),
                overlayColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(255, 255, 255, .3)),
                backgroundColor:  MaterialStatePropertyAll(
                    disable ? AppColor.gray :color ),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRaduis)))),
            child: leading == null
                ? Center(
              child: FittedBox(
                child: Text(
                  title ?? "",
                  style:disable?AppTextStyle.font18black500.copyWith(color:Constants.isDark?Colors.black: AppColor.white2,fontWeight: FontWeight.w400): titleStyle??AppTextStyle.font18black500.copyWith(color:Constants.isDark?Colors.black: AppColor.white2,fontWeight: FontWeight.w400),
                ),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading!,
                horizontalTitleGap?.ws ?? 20.ws,
                FittedBox(
                  child: Text(
                    title ?? "",
                    style:disable?(textStyle??AppTextStyle.font28bold700.copyWith(color: AppColor.white2)): (textStyle??AppTextStyle.font28bold700.copyWith(color: AppColor.white2)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
