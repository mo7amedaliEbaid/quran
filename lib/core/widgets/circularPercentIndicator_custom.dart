import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/color_manager.dart';
import 'text_custom/text_custom.dart';

class CircularPercentIndicatorCustom extends StatelessWidget {
  final double percent;
  final double? radius;
  final int? counter;
  final int? count;
  final double? fontSize;
  final double? fontSizeCount;
  final bool? tasbih;

  CircularPercentIndicatorCustom({
    required this.percent,
    this.radius,
    required this.counter,
    this.fontSize,
    this.fontSizeCount,
    this.tasbih = false,
    this.count,
    Key? key,
  }) : super(key: key);
  final ArabicNumbers arabicNumber = ArabicNumbers();

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius?.r ?? 80.r,
      lineWidth: 5.0.w,
      percent: percent,
      animation: true,
      animateFromLastPercent: true,

      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextCustom(
            text: arabicNumber.convert('$counter'),
            fontSize: fontSize ?? 50.sp,
            fontWeight: FontWeight.w500,
          ),
          Padding(
            padding: EdgeInsets.only(right: 65.0.w),
            child: TextCustom(
              text: '/${arabicNumber.convert('$count')}',
              fontSize: fontSizeCount ?? 18.sp,
            ),
          ),
        ],
      ),
      // onAnimationEnd:1,
      progressColor: ColorManager.primary,
    );
  }
}
