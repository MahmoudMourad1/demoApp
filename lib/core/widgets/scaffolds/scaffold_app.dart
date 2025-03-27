// import 'package:flutter/material.dart';
// import 'package:user/generated/assets.dart';
// import 'package:user/utils/app_utils/constants.dart';
//
// class ScaffoldApp extends StatelessWidget {
//   final Widget? body,bottomNavigationBar,floatingActionButton;
//   final PreferredSizeWidget? appBar;
//
//   const ScaffoldApp({Key? key, this.body, this.appBar, this.bottomNavigationBar, this.floatingActionButton}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar,
//       extendBodyBehindAppBar: true,extendBody: true,
//       floatingActionButton:floatingActionButton ,
//       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//       body:Constants.isDark? Center(child: SafeArea(child: body ?? Container())): Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(Assets.imagesBackground),
//                 fit: BoxFit.cover)),
//         child: Center(child: SafeArea(child: body ?? Container())),
//       ),
//       bottomNavigationBar: bottomNavigationBar,
//     );
//   }
// }
