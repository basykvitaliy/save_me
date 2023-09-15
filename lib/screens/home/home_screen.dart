import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:save_me/helpers/app_colors.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: AppTheme().colors!.barBg,
      ),
      backgroundColor: AppTheme().colors!.background,
      body: controller.bannerAd != null
          ? Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: controller.bannerAd!.size.width.toDouble(),
                height: controller.bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: controller.bannerAd!),
              ),
            )
          : Container(),
    );
  }
}
