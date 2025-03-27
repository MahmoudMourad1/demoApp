import 'package:flutter/cupertino.dart';
import 'package:user/config/style/app_color.dart';

class AppShadows{
  static const BoxShadow shadow1= BoxShadow(
    color: Color(0x3A000000),
    blurRadius: 20.90,
    offset: Offset(0, 9),
    spreadRadius: 0,
  );
  static const BoxShadow shadow2=BoxShadow(
    color: Color(0x30000000),
    blurRadius: 19.60,
    offset: Offset(0, 4),
    spreadRadius: 0,
  );
  static const BoxShadow shadow5=BoxShadow(
    color: Color(0x23000000),
    blurRadius: 8,
    offset: Offset(0, 1),
    spreadRadius: 1,
  );
  static const BoxShadow shadow3=BoxShadow(
    color: AppColor.gray,
    blurRadius: 9,
    offset: Offset(1, 4),
    spreadRadius: 0.1,
  );
  static const BoxShadow shadow4=BoxShadow(
    color: Color(0x23000000),
    blurRadius: 12.10,
    offset: Offset(0, 1),
    spreadRadius: 0,
  );
}