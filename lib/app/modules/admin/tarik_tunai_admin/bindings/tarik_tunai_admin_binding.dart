import 'package:get/get.dart';

import '../controllers/tarik_tunai_admin_controller.dart';

class TarikTunaiAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarikTunaiAdminController>(
      () => TarikTunaiAdminController(),
    );
  }
}
