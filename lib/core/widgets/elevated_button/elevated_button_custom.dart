import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../utils/values_manager.dart';
import '../text_custom/text_custom.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final double? radius;
  final double? width;
  final double? height;
  final double? elevation;
  final Color? colors;
  final Color? textColor;
  final double? fontSize;
  final Widget? widget;
  final Color? borderColor;
  final FontWeight? fontWeight;

  const ElevatedButtonCustom({
    Key? key,
    this.text,
    this.onPressed,
    this.radius = AppSize.s10,
    this.width = double.infinity,
    this.height = AppSize.s50,
    this.elevation = AppSize.s0,
    this.colors,
    this.fontSize,
    this.textColor = ColorManager.white,
    this.widget,
    this.borderColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
            side: BorderSide(color: borderColor ?? ColorManager.primary),
          ),
          backgroundColor: colors ?? ColorManager.primary,
          elevation: elevation,
          minimumSize: Size(width!, height!),

          // padding:
          //     EdgeInsets.symmetric(horizontal: width!.w, vertical: height!.h),
          textStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: textColor)),
      child: widget ??
          TextCustom(
              height: 0.0,
              text: text!,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              textAlign: TextAlign.center),
    );
  }
}
