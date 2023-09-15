
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
