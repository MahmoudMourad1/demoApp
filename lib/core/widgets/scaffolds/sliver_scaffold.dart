// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:user/config/routes/app_route_name.dart';
// import 'package:user/config/routes/app_routes.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/core/manager/cubit.dart';
// import 'package:user/core/manager/state.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/core/widgets/components/text_formfield.dart';
// import 'package:user/features/home/presentation/manager/cubit.dart';
// import 'package:user/features/home/presentation/manager/state.dart';
// import 'package:user/features/home/presentation/widgets/banner_item.dart';
// import 'package:user/features/home/presentation/widgets/category_widget.dart';
// import 'package:user/generated/assets.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/extentions/extention.dart';
//
// class SliverScaffold extends StatelessWidget {
//   final Widget body;
//   const SliverScaffold({super.key,required this.body});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit,HomeState>(
//       listener: (context,homeState){},
//       builder: (context,homeState) {
//         HomeCubit homeCubit=HomeCubit.get(context);
//         return BlocConsumer<AppCubit,AppState>(
//           listener: (context,state){},
//           builder: (context,state) {
//             return Scaffold(
//                 body: NestedScrollView(
//                     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
//                       return <Widget>[
//                         SliverOverlapAbsorber(
//                           handle:
//                           NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//
//                           sliver: SliverAppBar(
//
//                             pinned: true,
//                             floating: true,
//                             backgroundColor: AppColor.rose2,
//                             clipBehavior: Clip.none,
//                             // title:  Text(AppStrings.location,style: AppTextStyle.font18white600.copyWith(letterSpacing: 0.3),) ,
//                             toolbarHeight: 90.h,
//                             leadingWidth: MediaQuery.sizeOf(context).width,
//                             leading: Padding(
//                               padding:   EdgeInsets.only(right: 10.w,left: 10.w),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//
//                                 children: [
//                                   AppImageView(svgPath: Assets.svgLogoz,height: 30.h,width: 30.w,fit: BoxFit.fill,),
//                                   10.ws,
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(AppStrings.welcome,style: AppTextStyle.font14black2400,),
//                                       Row(
//                                         children: [
//                                           // AppImageView(svgPath: Assets.svgLocation,),
//                                           // 5.ws,
//                                           Text('${Constants.userData?.data?.name??''}',style: AppTextStyle.font18black500,),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   Spacer(),
//                                   InkWell(
//                                     onTap: ()async{
//                                       RouterApp.pushNamed(RouteName.notificationScreen);
//                                     },
//                                     child: Container(
//                                       height: 38.h,
//                                       width: 38.w,
//                                       padding: EdgeInsets.all(7),
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: AppColor.gray
//                                       ),
//                                       child: Center(
//                                         child: Icon(Icons.notifications,color: AppColor.black,),
//                                       ),
//                                     ),
//                                   ),
//                                   10.ws,
//                                 ],
//                               ),
//                             ),
//                             shape: ContinuousRectangleBorder(
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
//                             stretch: true,
//                             expandedHeight: MediaQuery.sizeOf(context).height*0.53,
//                             centerTitle: true,
//                             flexibleSpace:  FlexibleSpaceBar(
//                               centerTitle: true,
//                               titlePadding: EdgeInsets.zero,
//                               background: Container(
//                                 decoration:Constants.isDark?BoxDecoration(
//                                   color: AppColor.containerColor
//                                 ): BoxDecoration(
//                                     image: DecorationImage(
//                                         image: AssetImage(Assets.imagesAppbar3),
//                                         fit: BoxFit.fill
//                                     )
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     120.hs,
//                                     TextFieldApp(
//                                       hintText: AppStrings.searchAllServices,
//                                       // controller: carCubit.searchController,
//                                       onChanged: (String value) {
//                                         // carCubit.getFilterCar();
//
//                                       },
//                                       onTap: (){
//                                         RouterApp.pushNamed(RouteName.searchScreen);
//                                       },
//                                       hintStyle: AppTextStyle.font14black2400,
//                                       disableBorder: true,
//                                       readOnly: true,
//                                       fillColor: AppColor.searchContainerColor,
//                                       icon: Icon(
//                                         Icons.search,
//                                         color: AppColor.black2,
//                                         size: 24.w,
//                                       ),
//                                     ).withHorizontalPadding(14),
//                                     16.hs,
//                                     BannerItem(),
//                                   ],
//                                 ),
//                               ),
//
//                             ),
//                           ),
//                         ),
//                       ];
//                     },
//                     body:   Padding(
//                       padding: EdgeInsets.only(top: 90.h,),
//                       child: Container(
//                         color:Constants.isDark?Colors.black: AppColor.rose2,
//                         // padding: EdgeInsets.symmetric(horizontal: 14.w),
//                         child: CustomScrollView(
//                             slivers: <Widget>[
//                               SliverToBoxAdapter(
//                                 child: 60.hs,
//                               ),
//                               SliverToBoxAdapter(
//                                 child: body,
//                               )
//                             ]
//                         ),
//                       ),
//                     )
//                 )
//             );
//           }
//         );
//       }
//     );
//   }
// }
