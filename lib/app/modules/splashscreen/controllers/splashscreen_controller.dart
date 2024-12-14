import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    // Menunggu 3 detik sebelum pindah ke halaman NAVIGATION
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.offNamed(Routes.LOGIN); // Navigasi ke halaman NAVIGATION
    });
  }
}
