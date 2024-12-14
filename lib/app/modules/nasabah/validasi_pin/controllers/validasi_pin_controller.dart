import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../../constant/constant.dart';

class ValidasiPinController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  late String userPassword;

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void completePin(String pin) {
    userPassword = pin; // Menyimpan inputan user ke dalam variabel
    if (pin == '123456') {
      // Validasi PIN (contoh PIN yang benar)
      Get.offAllNamed(Routes.DETAIL_TRANSAKSI);
    } else {
      Get.snackbar(
        'Error',
        'Password salah',
        backgroundColor: Error.mainColor,
        colorText: White.white_50,
      );
      pinController.clear();
    }
  }
}
