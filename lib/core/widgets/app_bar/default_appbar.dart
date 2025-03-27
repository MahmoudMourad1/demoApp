// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:user/config/routes/app_route_name.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/utils/app_utils/app_route_name.dart';
//
// import '../../../generated/assets.dart';
//
// class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
//   const DefaultAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: 70.h,
//       backgroundColor: Colors.transparent,
//       flexibleSpace: Image(
//         height: 90.h,
//         image: AssetImage(Assets.imagesBackground),
//         fit: BoxFit.cover,
//       ),
//       title: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           AppImageView(imagePath:Assets.imagesLogo2,height: 26.h,width: 26.w,fit: BoxFit.fill,color: AppColor.black,),
//
//           // Spacer(),
//           // InkWell(
//           //   onTap: (){
//           //     // Navigator.pushNamed(context, RouteName.notificationScreen);
//           //     Navigator.of(context, rootNavigator: true).pushNamed(RouteName.notificationScreen);
//           //   },
//           //   child: Container(
//           //     height: 38.h,
//           //     width: 38.w,
//           //     padding: EdgeInsets.all(7),
//           //     decoration: BoxDecoration(
//           //       shape: BoxShape.circle,
//           //       color: AppColor.gray
//           //     ),
//           //     child: Center(
//           //       child: AppImageView(svgPath: Assets.svgNotification,height:19.h,width:18.w,fit: BoxFit.fill,color: AppColor.black,),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//       leading: null,
//       leadingWidth: 0,
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size(double.infinity, 70.h);}
