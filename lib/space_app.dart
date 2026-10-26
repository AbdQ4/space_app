import 'package:flutter/material.dart';
import 'package:space_app/core/routes_manager.dart';
import 'package:space_app/core/theme_manager.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Explorer',
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.appRoutes,
      initialRoute: '/',
      theme: ThemeManager.appTheme,
    );
  }
}
