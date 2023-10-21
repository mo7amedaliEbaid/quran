import 'package:flutter/material.dart';
import 'package:hesn_elmuslim/core/widgets/svg_pic/svg_pic.dart';

import '../utils/color_manager.dart';
import '../utils/values_manager.dart';

class Ornament extends StatelessWidget {
  final String iconName;
  final Color? iconColor;
  const Ornament(
      {Key? key,
      required this.iconName,
      this.iconColor = ColorManager.secondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPictureCustom(
        assetsName: iconName,
        height: AppSize.s50,
        width: AppSize.s50,
        color: iconColor);
  }
}
