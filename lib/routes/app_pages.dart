import 'package:get/get.dart';
import 'package:save_me/routes/routes.dart';
import 'package:save_me/screens/bottom_bar/menu_binding.dart';
import 'package:save_me/screens/bottom_bar/menu_screen.dart';
import 'package:save_me/screens/forum/forum_binding.dart';
import 'package:save_me/screens/forum/forum_screen.dart';
import 'package:save_me/screens/home/home_binding.dart';
import 'package:save_me/screens/home/home_screen.dart';
import 'package:save_me/screens/paying/paying_binding.dart';
import 'package:save_me/screens/paying/paying_screen.dart';
import 'package:save_me/screens/profile/profile_binding.dart';
import 'package:save_me/screens/profile/profile_screen.dart';
import 'package:save_me/screens/statistic/statistic_binding.dart';
import 'package:save_me/screens/statistic/statistic_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.menuScreen,
      page: () => MenuScreen(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: Routes.forumScreen,
      page: () => ForumScreen(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.statisticScreen,
      page: () => StatisticScreen(),
      binding: StatisticBinding(),
    ),
    GetPage(
      name: Routes.payingScreen,
      page: () => PayingScreen(),
      binding: PayingBinding(),
    ),
  ];
}
