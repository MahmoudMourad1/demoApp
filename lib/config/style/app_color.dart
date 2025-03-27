import 'package:flutter/material.dart';
import 'package:user/utils/app_utils/constants.dart';

class AppColor {

  static const Color blue =Color(0xFFFFCCB2);
  static const Color blue2 =Color(0xFFFFCCB2);
  static const Color buttonColor =Color(0xFF33021F);
  static const Color fuchsia =Color(0xFF81014D);
  static const Color fuchsia2 =Color(0xFF947886);
  static const Color rose =Color(0xFFFFCCB2);
  static const Color rose3 =Color(0xFFFFB793);
  // static const Color rose2 =Color(0xFFFFF4EE);
  static const Color background2 =Color(0xFFFFFAF8);
  static const Color blueLight5 =Color(0xffe6f7ff);
  static const Color blueLight =Color(0xFFEEF9FF);
  static const Color blueLight2 =Color(0xfff2fffe);
  static const Color blueLight3 =Color(0xffB2D0CE);
  static const Color whiteBorder =Color(0xFFE0E0E0);
  static const Color blackBorder =Color(0xFF353535);
  static const Color whiteContanier =Color(0xffffffff);
  static const Color blackContanier =Color(0xFF151515);
  static const Color unActiveFavoriteLight =Color(0xffA2BCBA);
  static const Color unActiveFavoriteDark =Color(0xffD4D4D4);
  static const Color black2 =Color(0xFF808080);
  static const Color slateGray =Color(0xFF808080);
  static const Color yellow =Color(0xFFFFC319);
  static const Color white2= Color(0xffffffff);
  // static const Color blue2= Color(0xFFD6E1E0);
  static const Color blue3= Color(0xFF8BC1DD);
  static const Color blue4= Color(0xff8DB4C9);
  static const Color blue5= Color(0xFFA3C5C2);
  static const Color blue6= Color(0xFF7DCEEF);
  static const Color blue7= Color(0xFFF4F7F9);
  static const Color blue8= Color(0xffe4eef4);
  static const Color blue9= Color(0xff96BECD);
  static const Color red= Color(0xFFFF0000);
  static const Color gray2= Color(0xFFF8F8F8);
  static const Color gray3= Color(0xFFA9A9A9);
  static const Color gray4= Color(0xFFf8f9fa);
  static const Color gray5= Color(0xFFDBDBDB);
  static const Color lightAqua= Color(0xFF95C1BD);
  static const Color backgroundOffWhite=Color(0xFFF5F5DC);
  static const Color gray10=Color(0xFFF6F6F6);
  static const Color brown=Color(0xFFEAAF49);
  static const Color brown3=Color(0xFFBD8118);
  static const Color brown2=Color(0xFFF9F4CA);
  static const Color green= Color(0xFF19B72C);

  static const Color brown4=Color(0xFFFFF5D1);
  static const Color brown5=Color(0xFFE5950B);
  static const Color glold=Color(0xFFF0E68C);
  static const Color bluegray=Color(0xFF89A3AD);
  static const Color bluegray2=Color(0xFFF2F2F2);
  static const Color gray11=Color(0xFF909090);
  static const Color dividerColorblue=Color(0xFFD7E6EE);
  static const Color bluegray3=Color(0xFF330019);
  static const Color blueFont=Color(0xFF5D8EA8);


  static Color get containerColor =>
      Constants.isDark ? blackContanier : whiteContanier;
  static Color get containerColor2 =>
      Constants.isDark ? blackContanier : Color(0xFFF3EDE3);
  static Color get containerColorblue =>
      Constants.isDark ? blackContanier : Color(0xFFAFC5D0);
  static Color get containerColor3 =>
      Constants.isDark ? blackContanier : Color(0xFFFFF9EE);
  static Color get containerColor4 =>
      Constants.isDark ? blackContanier : Color(0xFFFFF5D1);
  static Color get rose2 =>
      Constants.isDark ? rose : Color(0xFFFFF4EE);
  static Color get searchFieldColor =>
      Constants.isDark ? blackContanier : Color(0x19b0d1df);
  static Color get borderColor =>
      Constants.isDark ? blackBorder : whiteBorder;
  static Color get unFavoriteColor =>
      Constants.isDark ? unActiveFavoriteDark : unActiveFavoriteLight;
  static const Color gray =Color(0xffE3E3E3);
  static Color get background =>
      Constants.isDark ?  Colors.black : const Color(0xffffffff);
  static Color get containerColorMain =>
      Constants.isDark ?  blackContanier : const Color(0xFFFFFEFD);
  static Color get sliverBackground =>
      Constants.isDark ?  background : const Color(0xFFFFFEFD);
  static Color get unSelectedIndicatorColor =>
      Constants.isDark ? const Color(0xFF4F4F4F) : const Color(0xFFD3E1E8);

  static Color get white =>
      Constants.isDark ? const Color(0xff313131) : const Color(0xffffffff);
  static Color get textFieldColor =>
      Constants.isDark ? const Color(0xff313131) : const Color(0xFFFFFBFD);
  static Color get searchHintColor =>
      Constants.isDark ? const Color(0xff9C9C9C) : const Color(0xFFA1CADF);
  static Color get searchContainerColor =>
      Constants.isDark ? const Color(0xff2B2B2B) : const Color(0xFFF3F9FC);
  static Color get categoryContainerColor =>
      Constants.isDark ? const Color(0xff2A2B2E) : const Color(0xffEEF9FF);

  static Color get grayDivider =>
      Constants.isDark ? const Color(0xffEAE9E7) : const Color(0xffEAE9E7);
  static Color get black =>
      Constants.isDark ? const Color(0xffffffff) : const Color(0xff000000);
  static Color get black4 =>
      Constants.isDark ? const Color(0xffffffff) : const Color(0xff7A7A7A);
  static Color get black5 =>
      Constants.isDark ? const Color(0xffffffff) : const Color(0xFF656565);

  static Color get black3 =>
      Constants.isDark ? const Color(0xff4A4A4A) : const Color(0xff000000);
  static Color get yellowBackGround =>
      Constants.isDark ?  const Color(0xff313131):const Color(0xFFFFFFF4) ;
  static Color get sliverBackGround2 =>
      Constants.isDark ? Colors.black:background2 ;
  ///Bottom NavBar
  static Color get bavBarbackGround => Constants.isDark?const Color(0xff000000):Color(0xFF62BAE8);


}
