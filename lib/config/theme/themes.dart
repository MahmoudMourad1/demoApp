import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/app_color.dart';

class Themes {
  static ThemeData get light => ThemeData(
      fontFamily: RouterApp.currentContext?.languageCode=='ar'?'Almarai':'Akatab',
      primaryColor: AppColor.background,
      useMaterial3: false,
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.black
      ),
      appBarTheme: AppBarTheme(
        color: AppColor.background,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(color: AppColor.black),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColor.white,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColor.background)
          .copyWith(background: AppColor.background));
  static ThemeData get dark => ThemeData(
      fontFamily: RouterApp.currentContext?.languageCode=='ar'?'Almarai':'Akatab',
      primaryColor: AppColor.background,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        color: AppColor.background,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(color: AppColor.black),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColor.background,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColor.background)
          .copyWith(background: AppColor.background));
}
