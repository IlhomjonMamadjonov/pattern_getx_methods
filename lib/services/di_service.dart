import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/pages/payment_page.dart';
import 'package:pattern_getx/pages/setting_page.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => PaymentPage(), fenix: true);
    Get.lazyPut(() => SettingPage(), fenix: true);
  }
}
