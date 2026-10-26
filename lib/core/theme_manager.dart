import 'package:flutter/material.dart';
import 'package:space_app/core/colors_manager.dart';

class ThemeManager {
  static ThemeData get appTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorsManager.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManager.red,
        brightness: Brightness.dark,
        surface: ColorsManager.black,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: ColorsManager.white, height: 1.4),
      ),
      splashFactory: InkSparkle.splashFactory,
    );
  }
}
