import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/config/routes/app_route_name.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/manager/cubit.dart';
import 'package:user/core/widgets/buttons/app_button.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/core/widgets/scaffolds/scaffold_app.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/cache_utils/cach_saving.dart';
import 'package:user/utils/extentions/extention.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../utils/app_utils/constants.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
   if( context.languageCode=='ar'){
     setState(() {
       index=0;
     });
   }else{
     index=1;
   }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    BoxDecoration boxDecoration=BoxDecoration(
        color: AppColor.blueLight2,
        border: Border.symmetric(horizontal: BorderSide(color: AppColor.blue,width: 1))
    );
    return Scaffold(

      // body: SafeArea(
      //   child: Container(
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage(Assets.imagesLanguagebackGround),
      //         fit: BoxFit.fill
      //       )
      //     ),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //
      //       children: [
      //         10.hs,
      //        // SizedBox(
      //        //   width: double.infinity,
      //        //   child: Directionality(
      //        //     textDirection: TextDirection.ltr,
      //        //     child: Column(
      //        //       crossAxisAlignment: CrossAxisAlignment.center,
      //        //       children: [
      //        //         Text("Choose the Language",style: AppTextStyle.font28bold700,).withHorizontalPadding(16),
      //        //         4.hs,
      //        //         Text("اختر اللغة",style: AppTextStyle.font28bold700,).withHorizontalPadding(16),
      //        //
      //        //       ],
      //        //     ),
      //        //   ),
      //        // )
      //        // Center(child: AppImageView(imagePath: Assets.imagesLogo,)),
      //         36.hs,
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text('اختر اللغة',style: AppTextStyle.font20black600,),
      //             Text('Select Language',style: AppTextStyle.font20black400.copyWith(fontFamily: 'Akatab'),),
      //           ],
      //         ).withHorizontalPadding(14),
      //         10.hs,
      //         Divider(
      //           height: 2.h,thickness: 0.9,
      //           color: Color(0xFFE6E6E6),
      //         ).withHorizontalPadding(16),
      //         20.hs,
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             InkWell(
      //               onTap: (){
      //                 CacheSave.SaveisSelectLanguage(true);
      //                 setState(() {
      //                   index=0;
      //                   print(index);
      //                 });
      //                 AppCubit.get(context).changeLanguage(code: 'ar');
      //                 RouterApp.pushNamedAndRemoveUntil(RouteName.loginScreen);
      //               },
      //               child: Container(
      //                 padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:5.h),
      //                 width: 158.w,
      //                 height: 160.h,
      //                 decoration: ShapeDecoration(
      //                   color: Colors.white,
      //                   shape: RoundedRectangleBorder(
      //                     side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
      //                     borderRadius: BorderRadius.circular(13),
      //                   ),
      //                   shadows: [
      //                     BoxShadow(
      //                       color: Color(0x07000000),
      //                       blurRadius: 11.80,
      //                       offset: Offset(0, 4),
      //                       spreadRadius: 2,
      //                     )
      //                   ],
      //                 ),
      //                 child:Column(
      //                   children: [
      //                     AppImageView(imagePath: Assets.imagesArabicFlag,fit: BoxFit.fill,height: 100.h,width: 100.w,),
      //                     10.hs,
      //                     Text('عربي',style: AppTextStyle.font18black400,),
      //                     10.hs,
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             25.ws,
      //             InkWell(
      //               onTap: (){
      //                 CacheSave.SaveisSelectLanguage(true);
      //                 setState(() {
      //                   index=0;
      //                   print(index);
      //                 });
      //                 AppCubit.get(context).changeLanguage(code: 'en');
      //                 RouterApp.pushNamedAndRemoveUntil(RouteName.loginScreen);
      //               },
      //               child: Container(
      //                 width: 158.w,
      //                 height: 160.h,
      //                 padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:5.h),
      //                 decoration: ShapeDecoration(
      //                   color: Colors.white,
      //                   shape: RoundedRectangleBorder(
      //                     side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
      //                     borderRadius: BorderRadius.circular(13),
      //                   ),
      //                   shadows: [
      //                     BoxShadow(
      //                       color: Color(0x07000000),
      //                       blurRadius: 11.80,
      //                       offset: Offset(0, 4),
      //                       spreadRadius: 2,
      //                     )
      //                   ],
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     AppImageView(imagePath: Assets.imagesEnglishFlag,fit: BoxFit.fill,height: 100.h,width: 100.w,),
      //                     10.hs,
      //                     Text('English',style: AppTextStyle.font18black400.copyWith(fontFamily: 'Akatab'),),
      //                     10.hs,
      //                   ],
      //                 ),
      //               ),
      //             ),
      //
      //           ],
      //         ),
      //
      //         // InkWell(
      //         //   onTap: (){
      //         //     CacheSave.SaveisSelectLanguage(true);
      //         //     setState(() {
      //         //       index=0;
      //         //       print(index);
      //         //     });
      //         //     AppCubit.get(context).changeLanguage(code: 'ar');
      //         //     RouterApp.pushNamedAndRemoveUntil(RouteName.onBoarding);
      //         //   },
      //         //   child: Container(
      //         //     padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
      //         //     decoration: BoxDecoration(
      //         //         borderRadius: BorderRadius.circular(28),
      //         //         color: AppColor.buttonColor
      //         //     ),
      //         //     child: Row(
      //         //       mainAxisAlignment: MainAxisAlignment.center,
      //         //       children: [
      //         //         Spacer(),
      //         //         Text('اللغة العربية',style: AppTextStyle.font18black400.copyWith(color: Colors.white),),
      //         //         Spacer(),
      //         //         // AppImageView(svgPath: Assets.svgQataricon,height: 40.h,width: 40.w,fit: BoxFit.fill,),
      //         //       ],
      //         //     ),
      //         //   ).withHorizontalPadding(14),
      //         // ),
      //         // 30.hs,
      //         // InkWell(
      //         //   onTap: (){
      //         //     CacheSave.SaveisSelectLanguage(true);
      //         //     setState(() {
      //         //       index=0;
      //         //       print(index);
      //         //     });
      //         //     AppCubit.get(context).changeLanguage(code: 'en');
      //         //     RouterApp.pushNamedAndRemoveUntil(RouteName.onBoarding);
      //         //   },
      //         //   child: Container(
      //         //     padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
      //         //     decoration: BoxDecoration(
      //         //         borderRadius: BorderRadius.circular(28),
      //         //         color: AppColor.buttonColor
      //         //     ),
      //         //     child: Row(
      //         //       mainAxisAlignment: MainAxisAlignment.center,
      //         //       children: [
      //         //         Spacer(),
      //         //         Text('English UK',style: AppTextStyle.font18black400.copyWith(color: Colors.white),),
      //         //         Spacer(),
      //         //         // AppImageView(svgPath: Assets.svgEnglishicon,height: 40.h,width: 40.w,),
      //         //       ],
      //         //     ),
      //         //   ).withHorizontalPadding(14),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
