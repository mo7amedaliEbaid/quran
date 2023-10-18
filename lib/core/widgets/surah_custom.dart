import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import 'text_custom/text_custom.dart';

class SurahCustom extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final double? fontSize;
  const SurahCustom({Key? key, this.text, this.widget, this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        row(
            alignmentGeometry: Alignment.topRight,
            alignmentGeometry1: Alignment.topLeft,
            image: 'corner',
            image1: 'corner3'),
        widget ??
            TextCustom(
              textAlign: TextAlign.center,
              fontSize: fontSize?.sp,
              text: text!,
            ),
        row(
            alignmentGeometry: Alignment.bottomRight,
            alignmentGeometry1: Alignment.bottomLeft,
            image: 'corner2',
            image1: 'corner1'),
      ],
    );
  }

  Widget row(
      {required AlignmentGeometry alignmentGeometry,
      required AlignmentGeometry alignmentGeometry1,
      required String image,
      required String image1}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: alignmentGeometry,
          child: Image.asset(
            'assets/images/$image.png',
            width: 60.w,
            color: ColorManager.frameColor,
          ),
        ),
        Align(
          alignment: alignmentGeometry1,
          child: Image.asset(
            'assets/images/$image1.png',
            width: 60.w,
            color: ColorManager.frameColor,
          ),
        ),
      ],
    );
  }
}
