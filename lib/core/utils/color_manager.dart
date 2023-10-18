import 'package:flutter/material.dart';

class ColorManager {
  static Color swatch = HexColor.fromHex("#ff011C26");
  static const Color primary = Color(0xff011C26);
  static const Color secondary = Color(0xff175973);
  static const Color secondary1 = Color(0xff2E84A6);
  static const Color secondary2 = Color(0xff36A6BF);
  static const Color secondary3 = Color(0xffD3F2B3);

  static const Color scaffold = Color(0xffF3F7FA);

  static const Color darkGrey = Color(0xff525252);
  static const Color grey = Color(0xff737477);
  static const Color lightGrey = Color(0xff9E9E9E);
  static const Color black = Color(0xff000000);
  static const kGreenColor = Color(0xFF001E42);
  static const greenColor = Color(0xFF019875);
  static const Color indicatorColor = Color(0xffF7F7F7);
  static const Color labelUnSelectedColor = Color(0xffB2B2B2);
  static const Color prerequisiteCardColor = Color(0xffFCFCFC);

  // static const Color cardColor = Color(0xff98c1d9);
  static const Color cardColor = Color(0xff36A6BF);
  // static const Color card1Color = Color(0xff98DAD9);
  static const Color card1Color = Color(0xff2E84A6);

  static const Color frameColor = Color(0xff175973);
  static const Color checkboxColor = Color(0xffECECEC);
  static const Color textFormColor = Color(0xffF1F2F3);
  static const Color textFormIconColor = Color(0xffC0C3C6);
  static const Color textFormLabelColor = Color(0xff456B8D);
  static const Color textBackgroundColor = Color(0xffEDEDED);
  static const Color catCardColor = Color(0xffF3F7FA);

  // new colors
  static const kShadowColor = Color(0xFF364564);
  static const kAccentLightColor = Color(0xFFB3BFD7);

  static const Color grey1 = Color(0xff707070);
  static const Color grey2 = Color(0xff797979);
  static const Color white = Color(0xffFFFFFF);
  static const Color error = Color(0xffb71c1c); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
