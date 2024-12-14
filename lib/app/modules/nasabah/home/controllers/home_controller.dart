import 'package:get/get.dart';
import 'package:koperasi_app/app/data/model/history_model.dart';
import 'package:logger/web.dart';

import '../../../login/controllers/login_controller.dart';
import '../../../../data/model/user_model.dart';
import '../service/history_user_service.dart';
// import 'package:koperasi_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final HistoryUserService historyUserService = HistoryUserService();

  Rx<Login?> loggedInUser = Rx<Login?>(null);
  RxList<History> historyUser = <History>[].obs;

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
      List<dynamic> response = await historyUserService.historyUsers(loggedInUser.value!.id);
      historyUser.assignAll(response.map((data) => History.fromJson(data)).toList());
      logger.i("History user data loaded: ${historyUser.toString()}");
    } catch (e) {
      logger.e("Error loading history: $e");
    }
  }
}

