import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:save_me/ad/ad_mob.dart';
import 'package:save_me/base_controller.dart';

class HomeController extends BaseController {
  static HomeController get to => Get.find();
  FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController(text: "Search");

  BannerAd? bannerAd;

  @override
  void onInit() async{
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
            bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
    super.onInit();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

}
