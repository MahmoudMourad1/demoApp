import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';


class DropList extends StatelessWidget {
  final List<String> list;
  final String? selectedValue;
  final String? hint;
  final TextStyle? hintStyle;
  final ValueChanged<String?>? onChanged;

  const DropList({
    super.key,
    required this.list,
    this.hintStyle,
    this.onChanged,
    this.selectedValue,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint ?? '',
            style: hintStyle,
          ),
          borderRadius: BorderRadius.circular(15),
          style: hintStyle ,
          iconEnabledColor: Colors.black45,
          items: list
              .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: AppTextStyle.font28bold700,
            ),
          ))
              .toList(),
          onChanged: onChanged,
          value: selectedValue,
          icon: SizedBox(
            width: 24.w,
            height: 24.h,
            child: const FittedBox(
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColor.blue,
              ),
            ),
          ),
          dropdownColor: AppColor.white,
        ));
  }
}
