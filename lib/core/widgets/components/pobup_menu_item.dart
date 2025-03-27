// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:user/config/routes/app_route_name.dart';
// import 'package:user/config/routes/app_routes.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/core/widgets/components/divider_item.dart';
// import 'package:user/generated/assets.dart';
// import 'package:user/utils/app_utils/app_route_name.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/extentions/extention.dart';
//
// class PobUpMenuItem extends StatelessWidget {
//   final VoidCallback ontapEdit;
//   final String productId;
//   final String categoryId;
//   final Color? iconColor;
//   final Color? containerColor;
//   final bool isDeleted;
//   final bool isFeatured;
//   const PobUpMenuItem({super.key,required this.isDeleted,required this.isFeatured,required this.ontapEdit,required this.productId,required this.categoryId,this.iconColor,this.containerColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 34.h,
//
//       child: PopupMenuButton(
//
//         color: AppColor.containerColor,
//         itemBuilder: (ctx) => [
//           _popUpItem(
//               img: Assets.imagesEditicon,
//               title: AppStrings.edit,ontap:ontapEdit),
//         // if( isFeatured==false)...{
//         //   _popUpItem(
//         //       img: Assets.imagesCrown2,
//         //       title: AppStrings.markFeatured,
//         //       ontap: () async {
//         //         RouterApp.pushNamed(RouteName.paymentMethodScreen);
//         //         await MyAdsCubit.get(context)
//         //             .selectFeatureProduct(
//         //             productId: productId,
//         //             mainCategoryId: categoryId);
//         //       }),
//         // },
//         if( isDeleted)...{
//         _popUpItem(
//     img: Assets.imagesRighticon,
//     title: AppStrings.publish,
//     ontap: () async {
//     await MyAdsCubit.get(context)
//         .restoreRemovedAd(
//     productid: productId,
//     categoryId: categoryId);
//     }),
//         },
//           if(isDeleted==false)...{
//             _popUpItem(
//                 img: Assets.imagesDeleteicon,
//                 title: AppStrings.delete,
//                 isDelete: true,
//                 ontap: () async {
//                   await MyAdsCubit.get(context)
//                       .removeAd(
//                       productid: productId,
//                       categoryId: categoryId);
//                 }),
//           }
//         ],
//         padding: EdgeInsets.symmetric(
//             horizontal: 0, vertical: 0),
//         child: Icon(
//           Icons.more_vert_outlined,
//           color: Colors.white,
//         ),
//         // constraints:
//         // BoxConstraints(maxWidth: 240.w),
//       ),
//     );
//   }
//   PopupMenuItem _popUpItem(
//       {String? img, String? title, bool? isDelete, VoidCallback? ontap}) {
//     return PopupMenuItem(
//         onTap: ontap,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 AppImageView(
//                   imagePath: img,
//                   height: 24.w,
//                   width: 24.w,
//                 ),
//                 3.ws,
//                 Text(
//                   title ?? '',
//                   style: AppTextStyle.font14black400.copyWith(
//                       color: isDelete != null ? AppColor.red : AppColor.black),
//                 ),
//               ],
//             ),
//             isDelete != null ? 0.hs : DividerItem(),
//           ],
//         ));
//   }
// }
