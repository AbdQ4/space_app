import 'package:flutter/material.dart';
import 'package:space_app/core/colors_manager.dart';

class ThemeManager {
  static ThemeData get appTheme {
    return ThemeData(scaffoldBackgroundColor: ColorsManager.black);
  }
}
