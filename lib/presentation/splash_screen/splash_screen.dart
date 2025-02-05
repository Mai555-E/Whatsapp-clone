import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../resources/images.dart';
import '../resources/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void dispose() => {_timer.cancel(), super.dispose()};

  @override
  void initState() => {super.initState(), _startTimer()};

  void _navigateTo() => Get.toNamed(NamedRoutes.loginScreen);

  void _startTimer() => _timer = Timer(const Duration(seconds: 2), () => _navigateTo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(alignment: Alignment.topCenter, child: Image.asset(NamedImages.splashImage, width: 300.w, height: 330.h)),
            Text("The best chat app of this century", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
