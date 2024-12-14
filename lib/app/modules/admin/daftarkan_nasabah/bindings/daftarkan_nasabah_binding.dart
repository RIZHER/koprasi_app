import 'package:get/get.dart';

import '../controllers/daftarkan_nasabah_controller.dart';

class DaftarkanNasabahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarkanNasabahController>(
      () => DaftarkanNasabahController(),
    );
  }
}
