import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainMenuController extends GetxController with GetTickerProviderStateMixin {
  static MainMenuController get to => Get.find();

  final cont = PageController(initialPage: 0);

  static const double smallLogo = 100;
  static const double bigLogo = 200;

  RxBool isObscure$ = false.obs;
  bool get _isObscure => isObscure$.value;
  void toggleObscure() => isObscure$.value = !_isObscure;

  RxBool isPersonProfile = true.obs;
  final PersistentTabController tabController = PersistentTabController(initialIndex: 0);


  RxInt selectedIndex = 0.obs;
  @override
  void onInit() async {

    super.onInit();
  }


  Future<bool> onWillPop() async {
    return (await showDialog(
          context: Get.context!,
          builder: (context) => Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: SizedBox(
                width: Get.width / 1.3,
                height: 200,
                child: Scaffold(
                  body: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("doYouWantToExit".tr),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )) ??
        false;
  }

  static Future<void> pop({bool? animated}) async {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
