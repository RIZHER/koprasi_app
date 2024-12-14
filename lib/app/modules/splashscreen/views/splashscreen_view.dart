import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final SplashscreenController splashScreenController = Get.put(SplashscreenController());
   SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 282,
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
      ),
    );
  }
}
