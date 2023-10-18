import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

var defaultColor = ColorManager.swatch;

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    useMaterial3: true,
    colorSchemeSeed: ColorManager.secondary,
    brightness: Brightness.light,
    // primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightGrey,
    iconTheme: const IconThemeData(
      color: ColorManager.black,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorManager.primary),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorManager.black,
      selectedIconTheme:
          IconThemeData(color: ColorManager.black, size: AppSize.s28),
    ),
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    checkboxTheme: CheckboxThemeData(
      side: MaterialStateBorderSide.resolveWith(
          (_) => const BorderSide(width: 1, color: ColorManager.checkboxColor)),
      fillColor: MaterialStateProperty.all(ColorManager.primary),
      checkColor: MaterialStateProperty.all(ColorManager.checkboxColor),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.scaffold,
        // shadowColor: ColorManager.lightPrimary,
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
        ),
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManager.scaffold)),

    scaffoldBackgroundColor: ColorManager.scaffold,
    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      // splashColor: ColorManager.lightPrimary,
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.secondary,
    ),

    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        headlineLarge:
            getSemiBoldStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        headlineMedium:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding        contentPadding:  const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
            // borderSide:
            //     BorderSide(color: ColorManager.grey, width: 1.5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            // borderSide:
            //     BorderSide(color: ColorManager.primary, width: 1.5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            // borderSide:
            //     BorderSide(color: ColorManager.primary, width: 1.5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
