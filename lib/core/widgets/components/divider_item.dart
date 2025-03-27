import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';

class DividerItem extends StatelessWidget {
  final Color? color;
  const DividerItem({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color:color!=null?color: Color(0xffD7D7D7),
    );
  }
}