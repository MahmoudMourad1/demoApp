// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:user/config/routes/app_routes.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/app_shadows.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/core/widgets/components/text_formfield.dart';
// import 'package:user/features/home/presentation/widgets/banner_item.dart';
// import 'package:user/features/home/presentation/widgets/category_widget.dart';
// import 'package:user/generated/assets.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/extentions/extention.dart';
// class SliverPageScaffold extends StatefulWidget {
//   final Widget body;
//   final Color? backgroundColor;
//   final String title;
//   final Widget? bottomSheet;
//   final bool isHome;
//   const SliverPageScaffold({super.key,this.isHome=false,required this.title,this.backgroundColor,required this.body,this.bottomSheet});
//
//   @override
//   State<SliverPageScaffold> createState() => _SliverPageScaffoldState();
// }
//
// class _SliverPageScaffoldState extends State<SliverPageScaffold> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: NestedScrollView(
//             headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
//               return <Widget>[
//                 SliverOverlapAbsorber(
//                   handle:
//                   NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//
//                   sliver: SliverAppBar(
//
//                     pinned: true,
//                     floating: true,
//                     backgroundColor:AppColor.rose3,
//                     clipBehavior: Clip.none,
//                     title:  Text(widget.title,style: AppTextStyle.font20black600,) ,
//                     toolbarHeight: 90.h,
//                     actions: [
//                     widget.isHome?SizedBox():  InkWell(
//                         onTap: (){
//                           RouterApp.pop();
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           margin: EdgeInsets.only(left: 10.w),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.arrow_forward_ios,
//                               color: AppColor.buttonColor,
//                             ),
//                           ),
//                         ),
//                       ).withHorizontalPadding(10)
//                     ],
//                     leading: SizedBox(),
//                     shape: ContinuousRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular( Constants.isDark?0:50), bottomRight: Radius.circular( Constants.isDark?0:50))),
//                     stretch: true,
//                     flexibleSpace:  FlexibleSpaceBar(
//                       centerTitle: true,
//                       titlePadding: EdgeInsets.zero,
//                       background: Stack(
//                         children: [
//                          Constants.isDark?Container(): Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(Assets.imagesAppbar3,),
//                                     fit: BoxFit.fill
//                                 )
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: 17.h,
//                               decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0x1433021F),
//                                     blurRadius: 16.20,
//                                     offset: Offset(0, -3),
//                                     spreadRadius: 0,
//                                   )
//                                 ],
//                                   color:widget.backgroundColor!=null?widget.backgroundColor: Color(0XFFFFFAF8),
//                                   borderRadius: BorderRadius.only(topRight: Radius.circular(90),topLeft: Radius.circular(90))
//
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//
//                     ),
//                     expandedHeight: 115.h,
//                     centerTitle: true,
//                   ),
//                 ),
//               ];
//             },
//             body:   Padding(
//               padding: EdgeInsets.only(top: 65.h,),
//               child: Container(
//                 color:widget.backgroundColor!=null?widget.backgroundColor: Color(0XFFFFFAF8),
//                 // padding: EdgeInsets.symmetric(horizontal: 14.w),
//                 child: CustomScrollView(
//                     slivers: <Widget>[
//                       SliverToBoxAdapter(
//                         child: 60.hs,
//                       ),
//                       SliverToBoxAdapter(
//                         child: widget.body,
//                       )
//                     ]
//                 ),
//               ),
//             )
//         ),
//       bottomSheet: widget.bottomSheet,
//
//     );
//   }
// }
