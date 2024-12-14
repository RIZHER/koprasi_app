import 'package:get/get.dart';

import '../controllers/tarik_tunai_controller.dart';

class TarikTunaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarikTunaiController>(
      () => TarikTunaiController(),
    );
  }
}
