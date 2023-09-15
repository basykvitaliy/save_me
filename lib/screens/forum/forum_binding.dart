import 'package:get/get.dart';
import 'forum_controller.dart';


class ForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForumController());
  }
}
