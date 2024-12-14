import 'package:get/get.dart';

import '../controllers/validasi_pin_controller.dart';

class ValidasiPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidasiPinController>(
      () => ValidasiPinController(),
    );
  }
}
