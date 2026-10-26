import 'package:flutter/material.dart';
import 'package:space_app/view/details_screen.dart';
import 'package:space_app/view/home_screen.dart';
import 'package:space_app/view/intro_screen.dart';

class RoutesManager {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => IntroScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
    DetailsScreen.routeName: (context) => DetailsScreen(),
  };
}
