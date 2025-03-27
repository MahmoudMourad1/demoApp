// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:star_rating/star_rating.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/core/widgets/buttons/app_button.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/core/widgets/components/custom_button.dart';
// import 'package:user/core/widgets/components/text_formfield.dart';
// import 'package:user/generated/assets.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/extentions/extention.dart';
//
// class RateDialog extends StatelessWidget {
//
//   const RateDialog({super.key, });
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(surfaceTintColor: AppColor.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       insetPadding: const EdgeInsets.all(30),
//       clipBehavior: Clip.none,
//       backgroundColor: AppColor.white,
//       child: SizedBox(width: 500, child: Padding(
//         padding: const EdgeInsets.all(40),
//         child: Stack(clipBehavior: Clip.none, children: [
//           Positioned(top: -70,left: 0,right: 0,
//               child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Container(width: 100,height: 100,
//
//                     decoration: BoxDecoration(color:AppColor.rose, borderRadius: BorderRadius.circular(50),
//                     border: Border.all(color: AppColor.white,width: 7.w),
//                     ),
//                     child: Padding(padding: EdgeInsets.all(30),
//                         child: AppImageView(svgPath: Assets.svgLogoz, width: 40.w, height: 40.h,)))])),
//
//
//           Padding(padding: EdgeInsets.only(top: 10),
//             child: Column(mainAxisSize: MainAxisSize.min, children: [
//
//               20.hs,
//               Text(AppStrings.rateYourExperienceWithUs,style: AppTextStyle.font20black600,),
//               16.hs,
//               Center(
//                 child: RatingBar.builder(
//                   initialRating: 3,
//                   minRating: 1,
//                   direction: Axis.horizontal,
//                   allowHalfRating: true,
//                   itemCount: 5,
//                   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                   unratedColor: AppColor.gray5,
//                   itemBuilder: (context, _) => Icon(
//                     Icons.star,
//                     color:AppColor.yellow,
//                   ),
//                   onRatingUpdate: (rating) {
//                     print(rating);
//                   },
//                 ),
//               ),
//               10.hs,
//               TextFieldApp(
//                 hintText: AppStrings.writeYourReviewHere,
//                 isMultiLine: true,
//                 height: 180.h,
//
//               ),
//               16.hs,
//               AppButton(color: AppColor.buttonColor,title: AppStrings.rateUs,)
//
//
//             ]),
//           ),
//         ],
//         ),
//       )),
//     );
//   }
// }
