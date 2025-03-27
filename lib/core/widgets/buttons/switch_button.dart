
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';

class AppSwitchButton extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool>? onChanged;
  const AppSwitchButton({super.key,this.value,this.onChanged});

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _value=true;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 25.h,
      width: 25.w,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CupertinoSwitch(
          value:widget.value?? _value,
          activeColor: Color(0xFFFFB793),
          thumbColor: AppColor.white2,
          trackColor: AppColor.gray,
          onChanged:widget.onChanged?? (v){
            setState(() {
              _value=v;
            });
          },
        ),
      ),
    );
  }
}
