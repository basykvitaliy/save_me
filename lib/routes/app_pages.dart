import 'package:get/get.dart';
import 'package:save_me/routes/routes.dart';
import 'package:save_me/screens/home/home_binding.dart';
import 'package:save_me/screens/home/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
