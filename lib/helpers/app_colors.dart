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

  static const Color mainColor = Color(0xff31313f);
  static const Color mainDarkThemeColor = Color(0xff303030);

  final Color mainBackground;

  AppColors({required bool isDarkTheme})
      : mainBackground = isDarkTheme ? mainDarkThemeColor : mainColor;
}

class AppStyles {

  static const regularBodyDarkText10 = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black);
  static const regularBodyDarkText12 = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black);
  static const regularDarkText16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
  static const regularDarkTextBold16 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  static const regularHeading18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
  static const boldHeading22 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
  static const boldHeading28 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);
  static const boldBigHeading30 = TextStyle(fontSize: 30, fontWeight: FontWeight.w500, );
  static const boldBigHeading = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black);

  static const regularBodyGreyText13 = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey);
  static const regularBodyGreyText14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey);
  static const regularGreyText16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey);
  static const regularGreyHeading18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey);
  static const boldGreyHeading22 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey);

  static const regularBodyWhiteText = TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Colors.white);
  static const regularWhiteText12 = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white);
  static const regularWhiteText14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
  static const regularWhiteText16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
  static const regularWhiteHeading18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);
  static const boldWhiteHeading = TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white);
  static const boldWhite26 = TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white);
  static const boldWhite30 = TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white);


  static const regularBodyMainText = TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: AppColors.mainColor);
  static const boldMainHeading22 = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.mainColor);
  static const boldMainHeading24 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.mainColor);
  static const boldMainHeading28 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.mainColor);


  final TextStyle grayText16;


  AppStyles({required bool isDarkTheme}):
        grayText16 = hint16.copyWith(color: isDarkTheme ? AppColors.mainColor : AppColors.mainDarkThemeColor);


  static const headline1BaseStyle14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const headline1BaseStyle16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
  static const whiteColor16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const hint16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const hint14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const textBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const textBold20 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const textBold22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const whiteColor20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const textBold30 = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );


}


