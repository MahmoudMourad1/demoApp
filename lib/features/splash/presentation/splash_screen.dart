import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user/features/home/presentation/camera_screen.dart';
import 'package:user/features/home/presentation/home_screen.dart';

import '../../../core/manager/cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AppCubit.get(context).changeLanguage(code: 'en');
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>CameraScreen())
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Demo App ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
