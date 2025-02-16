import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../../../constant/constant.dart';
import '../../../../data/model/user_model.dart';
import '../../../../routes/app_pages.dart';
import '../../detail_transaksi/controllers/detail_transaksi_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../validasi_pin/controllers/validasi_pin_controller.dart';
import '../service/setor_tunai_service.dart';

class SetorTunaiController extends GetxController {
  Rx<Login?> loggedInUser = Rx<Login?>(null);

  @override
  void onInit() {
    super.onInit();
    textController.clear();
    Get.lazyPut<HomeController>(() => HomeController());
    loggedInUser.value = Get.find<HomeController>().loggedInUser.value;
    Get.lazyPut<ValidasiPinController>(() => ValidasiPinController());
    Get.lazyPut<DetailTransaksiController>(() => DetailTransaksiController());
  }

  // Controller untuk TextField
  final textController = TextEditingController();

  // Fungsi untuk mengatur nilai input field
  void setInputValue(String value) {
    textController.text = value; // Set nilai ke TextEditingController
  }

  void cekPass() {
    // Mengubah flag isSetorTunai menjadi true untuk menunjuk transaksi setor tunai
    Get.find<ValidasiPinController>().isSetorTunai.value =
        true; // **Perubahan: Mengubah flag isSetorTunai menjadi true**
    Get.toNamed(Routes.VALIDASI_PIN);
  }

  void onClose() {
    textController.dispose(); // Pastikan controller dihapus saat tidak dipakai
    super.onClose();
  }

  String generateRandomCode(int length) {
    final random = Random();
    String code = '';

    for (int i = 0; i < length; i++) {
      code += random.nextInt(10).toString(); // Menghasilkan angka acak dari 0-9
    }

    return code;
  }

  Future<void> doSetorTunai() async {
    String randomCode = generateRandomCode(12);
    try {
      final response = await SetorTunaiService().addTransaksi(
          id: loggedInUser.value!.id,
          Jenis_transaksi: 'Setor Tunai',
          kode_transaksi: int.parse(randomCode),
          Jumlah_transaksi: int.parse(textController.text),
          status: false,
          kantor: '');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.find<DetailTransaksiController>().setDetailTransaksi(
          noktp: loggedInUser.value!.noKtp.toString().obs,
          kodeTransaksi: randomCode.obs,
          nominalUang: int.parse(textController.text).obs,
        );
        // Jika berhasil
        Get.toNamed(Routes.DETAIL_TRANSAKSI);
        // Pindah ke halaman detail
        Get.snackbar(
          "Success",
          "Transaksi Setor Tunai success",
          backgroundColor: Success.mainColor,
        );
      } else {
        // Jika response tidak sesuai harapan
        Get.snackbar(
          "Error",
          "Gagal mendaftarkan melakukan transaksi. Silakan coba lagi.",
          backgroundColor: Error.mainColor,
        );
      }
    } catch (e) {
      // Tangani error
      Get.snackbar(
        "Error",
        "Terjadi kesalahan: $e",
        backgroundColor: Error.mainColor,
      );
    }
  }
}
