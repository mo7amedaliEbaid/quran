import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hesn_elmuslim/core/utils/color_manager.dart';

import '../utils/constants_manager.dart';
import '../utils/font_manager.dart';
import '../utils/routes_manager.dart';
import 'animated_toast/message_container.dart';

Future<bool?> showToast1(
    {required String message, Color color = ColorManager.greenColor}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: FontSize.s16,
  );
}

showToast(
  BuildContext context, {
  required String message,
  MessageType type = MessageType.success,
  bool requiredAction = false,
  VoidCallback? onPressed,
}) async {
  if (MediaQuery.of(context).viewInsets.bottom != 0) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        left: 5,
        right: 5,
        bottom: 15,
        child: messageContainer(
          context: context,
          text: message,
          type: type,
        ),
      );
    },
  );
  overlayState.insert(overlayEntry);
  await Future.delayed(
    const Duration(
      milliseconds: 3500,
    ),
  );

  overlayEntry.remove();
}

void navigatorAndRemove(context, String screenName) {
  Navigator.pushAndRemoveUntil(
      context, Routes.createRoute(screenName), (Route<dynamic> route) => false);
}

void navigator(context, String screenName) {
  Navigator.of(context).push(Routes.createRoute(screenName));
}
