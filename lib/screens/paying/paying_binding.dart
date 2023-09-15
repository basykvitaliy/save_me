import 'package:get/get.dart';
import 'paying_controller.dart';


class PayingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PayingController());
  }
}
