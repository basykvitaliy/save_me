import 'package:flutter/material.dart';
import 'package:save_me/helpers/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    this.height,
    required this.title,
    this.onTap,
    this.isDisabledBtn,
  }) : super(key: key);

  double? height;
  String title;
  final VoidCallback? onTap;
  bool? isDisabledBtn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, height ?? 60)),
          backgroundColor: isDisabledBtn! ? MaterialStateProperty.all<Color>(AppTheme().colors!.background) : MaterialStateProperty.all<Color>(AppTheme().colors!.background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
              )
          )
      ),
      onPressed: isDisabledBtn! ? onTap : null,
      child: Text(title, style: AppStyles.regularBodyWhiteText,),
    );
  }
}