// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ItemImage extends StatelessWidget {
//   final File? file;
//   final String? url;
//   final double? size;
//   final bool isEdit;
//
//   const ItemImage(
//       {super.key, this.file, this.url, this.size, this.isEdit = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size?.w ?? 60.w,
//       height: size?.h ?? 60.h,
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColor.primary, width: 1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: file != null || url != null
//           ? Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 AppImageView(
//                   file: file,
//                   url: url,
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.contain,
//                 ),
//                 if (isEdit)
//                   Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     decoration:
//                         const BoxDecoration(gradient: AppGradiant.gradiant1),
//                   ),
//                 if (isEdit)
//                   Positioned(
//                     bottom: 8.h,
//                     child: AppImageView(
//                       svgPath: Assets.svgCamera,
//                       width: 16.w,
//                       height: 16.h,
//                     ),
//                   )
//               ],
//             )
//           : Center(
//               child: AppImageView(
//                 svgPath: Assets.svgCamera,
//                 width: 32.w,
//                 height: 32.h,
//               ),
//             ),
//     );
//   }
// }
