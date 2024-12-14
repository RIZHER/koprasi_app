import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../data/model/history_model.dart';
import '../../../../data/model/user_model.dart';
import '../../../login/controllers/login_controller.dart';
import '../service/history_admin_service.dart';

class HomeAdminController extends GetxController {
  final HistoryAdminService historyAdminService = HistoryAdminService();

  Rx<Login?> loggedInUser = Rx<Login?>(null);
  RxList<History> historyAdmin = <History>[].obs;

  final Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    loggedInUser.value = Get.find<LoginController>().loggedInUser.value;
    logger.i(loggedInUser.toJson());
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      List<dynamic> response =
          await historyAdminService.historyAdmin(loggedInUser.value!.id);
      historyAdmin
          .assignAll(response.map((data) => History.fromJson(data)).toList());
      logger.i("History user data loaded: ${historyAdmin.toString()}");
    } catch (e) {
      logger.e("Error loading history: $e");
    }
  }
}
