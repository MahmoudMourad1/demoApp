import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/app_shadows.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class AppButton6 extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final double? horizontalTitleGap;
  final bool disabled;
  final bool loading;
  final Color?color;

  const AppButton6({
    super.key,
    this.title,
    this.trailing,
    this.onPressed,
    this.horizontalTitleGap,
    this.disabled = false,
    this.loading = false, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(boxShadow: AppShadows.shadow1),
      child: ElevatedButton(
          onPressed: loading||disabled ? () {} : onPressed ?? () {},
          style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(double.infinity, 55.h)),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              surfaceTintColor:
              const MaterialStatePropertyAll(Colors.transparent),
              overlayColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(255, 255, 255, .3)),
              backgroundColor: MaterialStatePropertyAll(
                  disabled&&!loading ? AppColor.gray2 :color?? AppColor.blue),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)))),
          child: trailing == null
              ? Center(
            child: loading
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "",
                  style: AppTextStyle.font16black400,
                ),
                10.ws,
                SizedBox(
                    width: 24.h,
                    height: 24.h,
                    child:   Center(
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                        ))),
              ],
            )
                : Text(
              title ?? "",
              style: AppTextStyle.font16black400.copyWith(color: Colors.white),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: AppTextStyle.font16black400.copyWith(color: Colors.white),
              ),
              horizontalTitleGap?.ws ?? 20.ws,
              trailing!,
            ],
          )),
    );
  }
}
