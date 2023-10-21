import 'package:flutter/material.dart';
import 'package:hesn_elmuslim/core/utils/strings_manager.dart';

import '../local/cache_helper.dart';
import 'color_manager.dart';

enum MessageType { success, error, warning }

class AppConstants {
  static Map<MessageType, Color> messageColors = {
    MessageType.success: ColorManager.primary,
    MessageType.error: ColorManager.error,
    MessageType.warning: Colors.orange
  };

  static Map<MessageType, IconData> messageIcon = {
    MessageType.success: Icons.done_rounded,
    MessageType.error: Icons.error_outline_rounded,
    MessageType.warning: Icons.warning_amber_rounded
  };
  static String token = CacheHelper.get(key: AppStrings.token) ?? '';
  static bool admin = CacheHelper.get(key: AppStrings.admin) ?? false;
  static String reciterName = '';
  static String surahName = '';
  static bool connected = true;
}
