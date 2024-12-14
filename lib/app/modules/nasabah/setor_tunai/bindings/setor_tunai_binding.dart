import 'package:get/get.dart';

import '../controllers/setor_tunai_controller.dart';

class SetorTunaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetorTunaiController>(
      () => SetorTunaiController(),
    );
  }
}
