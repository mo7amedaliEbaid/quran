import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? letterSpacing;

  final Color? color;

  final Color? decorationColor;

  final FontWeight? fontWeight;

  final TextDecoration decoration;

  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign textAlign;
  final double? height;
  final bool? softWrap;

  const TextCustom({
    Key? key,
    required this.text,
    this.fontSize = 14.0,
    this.color = ColorManager.primary,
    this.decorationColor = ColorManager.primary,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.height = 2.5,
    this.letterSpacing = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();

    return Text(
      arabicNumber.convert(text),
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: decoration,
          decorationColor: decorationColor,
          height: height),
    );
  }
}
