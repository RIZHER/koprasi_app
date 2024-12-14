import 'package:get/get.dart';

import '../controllers/setor_tunai_admin_controller.dart';

class SetorTunaiAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetorTunaiAdminController>(
      () => SetorTunaiAdminController(),
    );
  }
}
