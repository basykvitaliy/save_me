import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/helpers/app_colors.dart';
import 'button_widget.dart';

class SystemDialog {
  static Future<void> showDialog({
    String? title,
    String? firstButtonText,
    VoidCallback? firstButtonCallback,
    VoidCallback? secondButtonCallback,
    String? secondButtonText,
    double? height,
    bool isOnFirstButton = false,
    bool isOnSecondButton = false,
    Function? backFunction,
  }) async {
    if (Get.isBottomSheetOpen == null) Get.back();
    return Get.generalDialog(
      barrierDismissible: false,
      barrierLabel: 'BarrierLabel',
      barrierColor: AppTheme().colors!.background.withOpacity(0.9),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            width: Get.width / 1.1,
            height: height ?? 300,
            decoration: BoxDecoration(
                color: AppTheme().colors!.background, borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Scaffold(
                backgroundColor: AppTheme().colors!.background,
                body: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title != null
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Container(),
                      title != null ? SizedBox(height: isOnFirstButton ? 32 : 0) : Container(),
                      isOnFirstButton
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: ButtonWidget(
                                height: 50,
                                onTap: firstButtonCallback,
                                isDisabledBtn: true,
                                title: firstButtonText ?? '',
                              ),
                            )
                          : Container(),
                      SizedBox(height: isOnSecondButton ? 16 : 0),
                      isOnSecondButton
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: ButtonWidget(
                                height: 50,
                                onTap: secondButtonCallback,
                                isDisabledBtn: true,
                                title: secondButtonText ?? '',
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
