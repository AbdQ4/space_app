import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/controller/planet_selector.dart';
import 'package:space_app/space_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlanetSelector(),
      child: const SpaceApp(),
    ),
  );
}
