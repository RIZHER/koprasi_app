import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorTunaiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    textController.clear();
  }

  // Controller untuk TextField
  final textController = TextEditingController();

  // Fungsi untuk mengatur nilai input field
  void setInputValue(String value) {
    textController.text = value; // Set nilai ke TextEditingController
  }

  void onClose() {
    textController.dispose(); // Pastikan controller dihapus saat tidak dipakai
    super.onClose();
  }
}
