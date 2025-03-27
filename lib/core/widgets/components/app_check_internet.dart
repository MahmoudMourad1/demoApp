// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:soug/utils/helpers/check_internet.dart';
//
// class AppCheckInternetBuilder extends StatelessWidget {
//   final Widget child;
//
//   const AppCheckInternetBuilder({super.key, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       builder: (context, snapshot) {
//         final isConnected = CheckInternet.isConnected(snapshot.data);
//         return isConnected
//             ? child
//             : MaterialApp(
//                 theme: appTheme,
//                 debugShowCheckedModeBanner: false,
//                 home: const NoInternetScreen(),
//               );
//       },
//       stream: sl<Connectivity>().onConnectivityChanged,
//     );
//   }
// }
