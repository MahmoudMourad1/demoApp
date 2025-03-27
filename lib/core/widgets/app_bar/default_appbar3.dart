// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:soug/config/style/app_color.dart';
// import 'package:soug/config/style/text_style.dart';
// import 'package:soug/core/widgets/components/app_image_view.dart';
//
// import '../../../generated/assets.dart';
//
// class DefaultAppBar3 extends StatelessWidget implements PreferredSizeWidget{
//   final String title;
//   const DefaultAppBar3({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title,style: AppTextStyle.font18black500,),
//       centerTitle: true,
//       leading:  IconButton(onPressed: (){
//         Navigator.pop(context);
//       }, icon: Icon(Icons.close,color: AppColor.black,)),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size(double.infinity, 70.h);}
