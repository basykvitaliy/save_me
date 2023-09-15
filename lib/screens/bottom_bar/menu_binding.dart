import 'package:get/get.dart';
import 'package:save_me/screens/bottom_bar/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainMenuController());
  }
}
