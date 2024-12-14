import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarikTunaiController extends GetxController {
  // Controller untuk TextField
  final textController = TextEditingController();

  // Fungsi untuk mengatur nilai input field
  void setInputValue(String value) {
    textController.text = value; // Set nilai ke TextEditingController
  }

  @override
  void onClose() {
    textController.dispose(); // Pastikan controller dihapus saat tidak dipakai
    super.onClose();
  }
}
