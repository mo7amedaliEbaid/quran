import '../../../core/utils/color_manager.dart';
import 'package:flutter/material.dart';

import '../app_bar/app_bar_custom.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;

  final String? appBarTitle;
  final IconData? icon;
  final Function? onPressed;
  final Widget? bottomNavigationBar;
  final AppBarCustom? appBarCustom;
  final bool? condition;
  final bool? isExtend;
  final Widget? floatingActionButton;
  final Key? scaffoldKey;
  final Color? backgroundColor;

  const ScaffoldCustom({
    Key? key,
    required this.body,
    this.scaffoldKey,
    this.appBarTitle,
    this.icon,
    this.onPressed,
    this.bottomNavigationBar,
    this.appBarCustom,
    this.condition = true,
    this.isExtend = false,
    this.backgroundColor = ColorManager.scaffold,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: isExtend!,
      resizeToAvoidBottomInset: true,
      appBar: appBarCustom,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
