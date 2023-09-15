import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:save_me/routes/app_pages.dart';
import 'package:save_me/screens/home/home_screen.dart';
import 'package:save_me/translation/Messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/app_colors.dart';
import 'helpers/constants.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Permission for visible image network.
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;

  MobileAds.instance.initialize();

  /// Set theme
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var theme = sharedPreferences.getBool(Keys.isDarkTheme);
  if(theme == null){
    AppTheme().setTheme(isDark: false);
  }else{
    AppTheme().setTheme(isDark: theme);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      translations: Messages(),
      locale: Get.deviceLocale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

