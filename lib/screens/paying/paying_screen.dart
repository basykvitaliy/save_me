import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/helpers/app_colors.dart';
import 'paying_controller.dart';

class PayingScreen extends GetView<PayingController> {
  PayingScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(PayingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistic"),
        backgroundColor: AppTheme().colors!.barBg,
      ),
      backgroundColor: AppTheme().colors!.background,
    );
  }
}
