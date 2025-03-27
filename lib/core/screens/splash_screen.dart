// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:user/config/routes/app_route_name.dart';
// import 'package:user/config/routes/app_routes.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/app_status_bar.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/core/manager/cubit.dart';
// import 'package:user/core/widgets/components/app_image_view.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/cache_utils/cach_vars.dart';
// import 'package:user/utils/extentions/extention.dart';
//
// import '../../generated/assets.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _init();
//     // AppStatusBar.hide();
//     // carController = AnimationController(
//     //     vsync: this, duration: const Duration(milliseconds: 1100));
//     // carController.forward();
//     //
//     // titleController = AnimationController(
//     //     vsync: this, duration: const Duration(milliseconds: 800));
//     // titleController.forward();
//     super.initState();
//     _loading();
//   }
//
//   _init()async{
//     String? token =await CacheVars.token;
//     print('splashhh');
//     print(token);
//     if (token!=null&&(CacheVars.token??'').isNotEmpty) {
//     }
//     // HomeCubit homeCubit=HomeCubit.get(context);
//     // await homeCubit.getBanners();
//   }
//   _loading() {
//     AppCubit.get(context).changeLanguage(code: 'en');
//     Timer(const Duration(seconds: 3), () {
//         // RouterApp.pushNamedAndRemoveUntil(RouteName.chooseLanguage);
//
//       if(CacheVars.token!=null&&(CacheVars.token??'').isNotEmpty){
//
//         RouterApp.pushNamedAndRemoveUntil(RouteName.layout);
//         // if(Constants.userData?.data?.userType=='user'){
//         //   Constants.isCompany=false;
//         // }else{
//         //   Constants.isCompany=true;
//         // }
//       }else{
//         bool isSelectLanguage =CacheVars.isSelectLanguage??false;
//         if(isSelectLanguage){
//           // RouterApp.pushNamedAndRemoveUntil(RouteName.chooseLanguage);
//
//           RouterApp.pushNamedAndRemoveUntil(RouteName.onBoarding);
//         }else{
//           RouterApp.pushNamedAndRemoveUntil(RouteName.onBoarding);
//         }
//       }
//
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'test')));
//     });
//   }
//
//   @override
//   void dispose() {
//     // carController.reverse();
//     // carController.dispose();
//     // titleController.reverse();
//     // titleController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//     // AppStatusBar.show();
//   }
//   late AnimationController carController;
//   late AnimationController titleController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration:   BoxDecoration(
//             // color: AppColor.white,
//               image: DecorationImage(
//                   image: AssetImage(Assets.imagesSplash), fit: BoxFit.fill)),
//           // child: Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.center,
//           //     children: [
//           //       Spacer(),
//           //       30.hs,
//           //
//           //       SlideTransition( position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
//           //           .animate(titleController),
//           //       child: Column(
//           //         children: [
//           //           Text('Welcome to user App',style: AppTextStyle.font24brown600.copyWith(color: Color(0xFF595959)),),
//           //           20.hs,
//           //           AppImageView(imagePath: Assets.imagesLogo,),
//           //         ],
//           //       ),
//           //       ),
//           //       Spacer(),
//           //       SlideTransition(
//           //         position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//           //             .animate(carController),
//           //         child: Align(
//           //           alignment: Alignment.center,
//           //           child: AppImageView(imagePath: Assets.imagesSplashcar,height: MediaQuery.sizeOf(context).height*0.7,fit: BoxFit.fill,),
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // ),
//         ));
//   }
// }
