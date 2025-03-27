
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';

class AppCheckBoxButton extends StatefulWidget {
  // final bool value;
  // final ValueChanged<bool>? onChanged;
  const AppCheckBoxButton({super.key,});

  @override
  State<AppCheckBoxButton> createState() => _AppCheckBoxButtonState();
}

class _AppCheckBoxButtonState extends State<AppCheckBoxButton> {
  bool _value=false;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 50.h,
      width: 24.w,
      child: ClipRRect(
        clipBehavior: Clip.none,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)),
            value: _value,
            side: BorderSide(color: Color(0xffA9A9A9),width: 1),
            activeColor: AppColor.blue,
            checkColor: AppColor.white2,
            onChanged: (v){
              setState(() {
                _value=v??false;
              });
            },
          ),
        ),
      ),
    );
  }
}
