import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/helpers/app_colors.dart';

import 'statistic_controller.dart';

class StatisticScreen extends GetView<StatisticController> {
  StatisticScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(StatisticController());

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
