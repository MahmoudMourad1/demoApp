import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/app_color.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppTextStyle {
  ///FontSize
  static final TextStyle _fontSize28 = TextStyle(fontSize: 26.sp);
  static final TextStyle _fontSize16 = TextStyle(fontSize: 16.sp);
  static final TextStyle _fontSize12 = TextStyle(fontSize: 12.sp);
  static final TextStyle _fontSize13 = TextStyle(fontSize: 13.sp);
  static final TextStyle _fontSize11 = TextStyle(fontSize: 11.sp);
  static final TextStyle _fontSize14 = TextStyle(fontSize: 14.sp);
  static final TextStyle _fontSize18 = TextStyle(fontSize: 18.sp);
  static final TextStyle _fontSize20 = TextStyle(fontSize: 20.sp);
  static final TextStyle _fontSize17 = TextStyle(fontSize: 17.sp);
  static final TextStyle _fontSize15 = TextStyle(fontSize: 15.sp);
  static final TextStyle _fontSize26 = TextStyle(fontSize: 26.sp);
  static final TextStyle _fontSize24 = TextStyle(fontSize: 24.sp);
  static final TextStyle _fontSize22 = TextStyle(fontSize: 22.sp);
  static final TextStyle _fontSize19 = TextStyle(fontSize: 19.sp);

  static const TextStyle _fontWeight200= TextStyle(fontWeight: FontWeight.w200);
  static const TextStyle _fontWeight300= TextStyle(fontWeight: FontWeight.w300);
  static const TextStyle _fontWeight400= TextStyle(fontWeight: FontWeight.w400);
  static const TextStyle _fontWeight500= TextStyle(fontWeight: FontWeight.w500);
  static const TextStyle _fontWeight600= TextStyle(fontWeight: FontWeight.w600);
  static const TextStyle _fontWeight700= TextStyle(fontWeight: FontWeight.w700);
  static const TextStyle _fontWeight800= TextStyle(fontWeight: FontWeight.w800);
  static const TextStyle _fontWeight900= TextStyle(fontWeight: FontWeight.w900);

  ///Font Family
  static  TextStyle _fontInter = TextStyle(fontFamily: RouterApp.currentContext?.languageCode=='ar'?'Almarai':"Akatab");

  ///FontStyle
  static TextStyle get font28bold700 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize28)
      .copyWith(color: AppColor.black);
  // static TextStyle get fontPlate => TextStyle(fontFamily: "user-Plate-Bold").merge(_fontSize26).copyWith(color: Colors.black);
  static TextStyle get font16bold400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);
  static TextStyle get font16blue400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font14blue400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font18fuchsia400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize18)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font16blue600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font15bold500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize15)
      .copyWith(color: AppColor.black);
  static TextStyle get font14searchHintColor400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.searchHintColor);
  static TextStyle get font11black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize11)
      .copyWith(color: AppColor.black);
  static TextStyle get font13black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize13)
      .copyWith(color: AppColor.black);
  static TextStyle get font13black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize13)
      .copyWith(color: AppColor.black2);
  static TextStyle get font14black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black);
  static TextStyle get font14black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black);
  static TextStyle get font13black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize13)
      .copyWith(color: AppColor.black);
  static TextStyle get font13Red400 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize13)
      .copyWith(color: AppColor.red);
  static TextStyle get font14black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black);
  static TextStyle get font14fuchia400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font18bluegray3400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize18)
      .copyWith(color: AppColor.bluegray3);
  static TextStyle get font14black2500 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black2);
  static TextStyle get font14black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black2);
  static TextStyle get font18blue700 => _fontInter
      .merge(_fontWeight700)
      .merge(_fontSize18)
      .copyWith(color: AppColor.fuchsia);
  static TextStyle get font18black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize18)
      .copyWith(color: AppColor.black);
  static TextStyle get font19black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize19)
      .copyWith(color: AppColor.black);

  static TextStyle get font16black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);
  static TextStyle get font16black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);
  static TextStyle get font16brown600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColor.brown3);
  static TextStyle get font16gray11600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColor.gray11);
  static TextStyle get font16black4500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black4);
  static TextStyle get font16black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);
  static TextStyle get font16fuchsia2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.fuchsia2);
  static TextStyle get font26black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize26)
      .copyWith(color: Colors.black);
  static TextStyle get font18black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize18)
      .copyWith(color: AppColor.black);
  static TextStyle get font18black700 => _fontInter
      .merge(_fontWeight700)
      .merge(_fontSize18)
      .copyWith(color: AppColor.black);

  static TextStyle get font18black2500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize18)
      .copyWith(color: AppColor.black);
  static TextStyle get font14black2300 => _fontInter
      .merge(_fontWeight300)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black2);
  static TextStyle get font16black2300 => _fontInter
      .merge(_fontWeight300)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black2);
  static TextStyle get font16black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black2);
  static TextStyle get  font12black2300 => _fontInter
      .merge(_fontWeight300)
      .merge(_fontSize12)
      .copyWith(color: AppColor.black2);
  static TextStyle get  font15black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black2);
  static TextStyle get  font15black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black);
  static TextStyle get  font15slateGray400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.slateGray);

  static TextStyle get  font12black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize12)
      .copyWith(color: AppColor.black2);
  static TextStyle get  font17black2400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize17)
      .copyWith(color: AppColor.black2);
  static TextStyle get  font17black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize17)
      .copyWith(color: AppColor.black);
  static TextStyle get  font18white500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize18)
      .copyWith(color: AppColor.white2);
  static TextStyle get  font18white600 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize18)
      .copyWith(color: AppColor.white2);
  static TextStyle get  font13white500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize13)
      .copyWith(color: AppColor.white2);


  ///user
  static TextStyle get  font24brown600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize24)
      .copyWith(color: AppColor.brown);
  static TextStyle get  font18whit600 => _fontInter
      .merge(_fontWeight700)
      .merge(_fontSize18)
      .copyWith(color: Colors.white);
  static TextStyle get  font22white600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize22)
      .copyWith(color: Colors.white);
  static TextStyle get  font22black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize22)
      .copyWith(color: AppColor.black);
  static TextStyle get  font22blue600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize22)
      .copyWith(color: AppColor.blue6);
  static TextStyle get  font18blueGray400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize18)
      .copyWith(color: AppColor.bluegray);
  static TextStyle get  font20blueGray500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize20)
      .copyWith(color: AppColor.bluegray);
  static TextStyle get  font20blueGray400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize17)
      .copyWith(color: AppColor.bluegray);
  static TextStyle get  font20black500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize20)
      .copyWith(color: AppColor.black);
  static TextStyle get  font20black600 => _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize20)
      .copyWith(color: AppColor.black);
  static TextStyle get  font20black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize20)
      .copyWith(color: AppColor.black);
  static TextStyle get  font14blueGray400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.bluegray);
  static TextStyle get  font14blueFont00 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.blueFont);
  static TextStyle get  font17blue6500 => _fontInter
      .merge(_fontWeight500)
      .merge(_fontSize17)
      .copyWith(color: AppColor.blue6);
  static TextStyle get  font18black400 => _fontInter
      .merge(_fontWeight400)
      .merge(_fontSize18)
      .copyWith(color: AppColor.black);
}
