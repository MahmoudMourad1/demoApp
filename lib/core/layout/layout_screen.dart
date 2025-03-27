// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LayoutScreen extends StatefulWidget {
//   const LayoutScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LayoutScreen> createState() => _LayoutScreenState();
// }
//
// class _LayoutScreenState extends State<LayoutScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     //   if (mounted) {
//     //   }
//     // });
//   }
//
//   List<String> iconList = [
//     Assets.imagesExploreicon,
//     Assets.imagesFavoriteicon,
//     Assets.imagesAdsicon,
//     Assets.imagesAccounticon,
//   ];
//
//   // default index of the tabs
//   int _bottomNavIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       builder: (context, state) {
//         final currentIndex = AppCubit.get(context).currentIndex;
//         return WillPopScope(
//           onWillPop: () async {
//             if (RouterKeys.navigatorKey.currentState?.canPop() ?? false) {
//               RouterKeys.navigatorKey.currentState?.pop();
//             } else {
//               if (AppCubit.get(context).currentIndex != 0) {
//                 AppCubit.get(context).changeCurrentIndex(0);
//               } else if (AppCubit.get(context).currentIndex == 0) {
//                 showDialog(
//                     context: context,
//                     builder: (context) => ConfirmationDialog(
//                           description: AppStrings.exitApp,
//                           onYesPressed: () {
//                             SystemNavigator.pop();
//                             exit(0);
//                           },
//                           icon: Assets.imagesLogout,
//                         ),
//                     useSafeArea: true,
//                     barrierDismissible: false);
//               }
//             }
//             return false;
//           },
//           child: Scaffold(
//             extendBody: AppCubit.get(context).extendBody,
//             // drawer: const DrawerPage(),
//             body: Builder(builder: (context) {
//               return Navigator(
//                 key: RouterKeys.navigatorKey,
//                 onGenerateRoute: RouteScreens.generateRoute,
//               );
//             }),
//             floatingActionButton: Padding(
//               padding: EdgeInsets.all(7),
//               child: FloatingActionButton(
//                   backgroundColor: AppColor.blue,
//                   child: Icon(Icons.add),
//                   onPressed: () {
//                     Navigator.of(context,rootNavigator: true).pushNamed(RouteName.adTypeScreen);
//                   }),
//             ),
//             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//             bottomNavigationBar: DefaultBottomNavBar(
//                 currentIndex: AppCubit.get(context).currentIndex,
//                 onTap: AppCubit.get(context).changeCurrentIndex),
//           ),
//         );
//       },
//       listener: (context, state) {},
//     );
//   }
// }
