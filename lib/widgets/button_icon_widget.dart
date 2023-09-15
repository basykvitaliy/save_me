import 'package:flutter/material.dart';
import 'package:save_me/helpers/app_colors.dart';

class ButtonIconWidget extends StatelessWidget {
  ButtonIconWidget({
    Key? key,
    this.height,
    this.width,
    required this.icon,
    this.onTap,
    this.isDisabledBtn,
  }) : super(key: key);

  double? width;
  double? height;
  Icon icon;
  final VoidCallback? onTap;
  bool? isDisabledBtn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(width ?? 50, height ?? 50)),
          backgroundColor: MaterialStateProperty.all<Color>(AppTheme().colors!.background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
              )
          )
      ),
      onPressed: isDisabledBtn! ? onTap : null,
      child: icon,
    );
  }
}