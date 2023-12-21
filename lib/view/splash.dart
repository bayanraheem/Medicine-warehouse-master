import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/SplashController.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Image.asset(
            "assets/image/photo1700768808-removebg-preview.png",
          ),
        ),
      ),
    );
  }
}
