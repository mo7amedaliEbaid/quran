import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import 'package:hesn_elmuslim/core/widgets/elevated_button/elevated_button_custom.dart';
import 'package:hesn_elmuslim/core/widgets/text_custom/text_custom.dart';

import '../utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final VoidCallback? onPress;

  const ErrorWidgetCustom({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: ColorManager.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: const TextCustom(
              text: 'حدث خطأ',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        const TextCustom(
            text: 'اعادة المحاولة',
            color: ColorManager.grey1,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButtonCustom(
            text: 'اعادة المحاولة',
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
