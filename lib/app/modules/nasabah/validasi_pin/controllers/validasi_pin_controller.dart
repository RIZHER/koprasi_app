import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/user_model.dart';
import '../../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../service/validasi_pin_service.dart';
import '../../setor_tunai/controllers/setor_tunai_controller.dart'; // Import SetorTunaiController
import '../../tarik_tunai/controllers/tarik_tunai_controller.dart'; // Import TarikTunaiController

class ValidasiPinController extends GetxController {
  PasswordService passwordService = PasswordService();
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  Rx<Login?> loggedInUser = Rx<Login?>(null);

  // Flag untuk menentukan jenis transaksi
  RxBool isSetorTunai = true
      .obs; // Default setor tunai // **Perubahan: Menambahkan flag isSetorTunai**

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<HomeController>(() => HomeController());
    loggedInUser.value = Get.find<HomeController>().loggedInUser.value;
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  Future<void> cekUserPassword() async {
    bool passwordCorrect = await passwordService.cekPassword(
        loggedInUser.value!.username, pinController.text);
    if (passwordCorrect) {
      // Password sesuai
      print("Password matches!");
      print(isSetorTunai.value);

      // Menentukan transaksi yang akan dijalankan
      if (isSetorTunai.value) {
        // **Perubahan: Memeriksa flag isSetorTunai**
        // Jika setor tunai
        Get.find<SetorTunaiController>().doSetorTunai();
        Get.offNamed(Routes.SETOR_TUNAI);
      } else {
        // Jika tarik tunai
        Get.find<TarikTunaiController>().doTarikTunai();
        Get.offNamed(Routes.TARIK_TUNAI);
      }
      resetPinController();
    } else {
      // Password tidak sesuai
      print("Incorrect username or password.");
    }
  }

  void resetPinController() {
    pinController.clear(); // Membersihkan nilai input
  }
}
