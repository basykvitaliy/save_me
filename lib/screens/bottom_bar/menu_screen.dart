import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:save_me/helpers/app_colors.dart';
import 'package:save_me/screens/home/home_screen.dart';

import 'menu_controller.dart';

class MenuScreen extends GetView<MainMenuController> {
  MenuScreen({Key? key}) : super(key: key);

  @override
  final MainMenuController controller = Get.put(MainMenuController());
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.onWillPop,
        child: Obx(
          () => Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme().colors!.background,
            body: _buildScreens()[controller.selectedIndex.value],
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              borderColor: AppColors.secondLightColor.withOpacity(0.3),
              borderWidth: 3,
              blurEffect: true,
              activeColor:Colors.white,
              inactiveColor: AppTheme().colors!.second,
              activeIndex:  controller.selectedIndex.value,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 10,
              rightCornerRadius: 10,
              onTap: (index) async {
                controller.selectedIndex.value = index;
              },
              backgroundColor: AppTheme().colors!.second,
              elevation: 0, icons: iconList,
            ),
          ),
        ));
  }
}

final iconList = <IconData>[
  Icons.home,
  Icons.favorite,
  Icons.remove_red_eye,
  Icons.person,
];

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
  ];
}
