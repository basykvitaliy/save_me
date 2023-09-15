import 'package:flutter/material.dart';
import 'package:save_me/helpers/app_colors.dart';

class ButtonLoadingWidget extends StatelessWidget {
  ButtonLoadingWidget({
    Key? key,
    required this.textButton,
    required this.isChangeBtn,
    required this.onTap,
    this.width,
    this.fontWeight,
    this.height,
    this.bgColor,
    this.isDisabledBtn,
    this.large,
  }) : super(key: key);
  final String textButton;
  final bool isChangeBtn;
  FontWeight? fontWeight;
  bool? isDisabledBtn;
  final VoidCallback onTap;
  double? width;
  double? height = 60;
  Color? bgColor;
  bool? large = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: isDisabledBtn!
            ? BoxDecoration(
                color: isChangeBtn ? bgColor ?? AppColors.mainColor : Colors.transparent,
                border: isChangeBtn ? Border.all(width: 0, color: Colors.transparent) : Border.all(width: 1, color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(30),
              )
            : BoxDecoration(
                color: AppColors.mainDarkThemeColor,
                borderRadius: BorderRadius.circular(30),
              ),
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            width: large! ? 60 : MediaQuery.of(context).size.width / 1.1,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: !isChangeBtn ? MaterialStateProperty.all(AppColors.mainColor) : MaterialStateProperty.all(AppColors.mainColor),
                textStyle:
                    isChangeBtn ? MaterialStateProperty.all(AppStyles.regularHeading18) : MaterialStateProperty.all(AppStyles.regularHeading18),
              ),
              onPressed: isDisabledBtn! ? onTap : null,
              child: Text(
                      textButton,
                      style: isChangeBtn
                          ? fontWeight == null
                              ? AppStyles.regularWhiteHeading18
                              : AppStyles.regularWhiteHeading18.copyWith(fontWeight: fontWeight)
                          : AppStyles.regularHeading18,
                    ),
            ),
          ),
        ));
  }
}
