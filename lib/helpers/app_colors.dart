import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class AppTheme extends GetxService {
  static final AppTheme _instance = AppTheme._();

  factory AppTheme() => _instance;

  AppTheme._();

  AppColors? colors;
  AppStyles? styles;
  bool isDarkTheme = false;

  bool get isLightTheme => !isDarkTheme;

  ///Colors should be set first!
  void setTheme({required bool isDark}) {
    isDarkTheme = isDark;
    colors = AppColors(isDarkTheme: isDarkTheme);
    styles = AppStyles(isDarkTheme: isDarkTheme);
  }
}

class AppColors {

  static const Color mainDarkColor = Color(0xff31394E);
  static const Color secondColor = Color(0xffE6C299);
  static const Color secondLightColor = Color(0xffEBCFAF);
  static const Color mainColor = Color(0xfffdfdfd);
  static const Color darkTextColor = Color(0xfffdfdfd);
  static const Color mainTextColor = Color(0xff31394E);
  static const Color redError = Color(0xffa60d0d);
  static const Color helpDarkColor = Color(0xff53586C);
  static const Color helpMainColor = Color(0xffe9e9e9);
  static const Color bgBarDarkColor = Color(0xff283249);
  static const Color bgBarMainColor = Color(0xfff9f9f9);

  final Color background;
  final Color barBg;
  final Color second;
  final Color helpColor;

  AppColors({required bool isDarkTheme})
      : background = isDarkTheme ? mainDarkColor : mainColor,
        barBg = isDarkTheme ? bgBarDarkColor : bgBarMainColor,
        second = isDarkTheme ? secondColor : secondColor,
        helpColor = isDarkTheme ? helpDarkColor : helpMainColor;
}

class AppStyles {

  static const regularBodyDarkText10 = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black);

  static const regularBodyGreyText13 = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey);

  static const regularBodyWhiteText = TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Colors.white);

  static const regularBodyMainText = TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: AppColors.mainColor);



  /// Text style.
  final TextStyle grayText16;

  AppStyles({required bool isDarkTheme}):
        grayText16 = hint16.copyWith(color: isDarkTheme ? AppColors.mainTextColor : AppColors.darkTextColor);


  static const hint16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

}


