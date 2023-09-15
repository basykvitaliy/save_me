import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/helpers/app_colors.dart';
import 'package:save_me/screens/paying/paying_controller.dart';
import 'package:save_me/screens/profile/profile_controller.dart';


class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  var controller = Get.put(ProfileController());

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
