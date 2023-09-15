import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:save_me/helpers/app_colors.dart';

import 'forum_controller.dart';

class ForumScreen extends GetView<ForumController> {
  ForumScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(ForumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: AppTheme().colors!.barBg,
      ),
      backgroundColor: AppTheme().colors!.background,
    );
  }
}
