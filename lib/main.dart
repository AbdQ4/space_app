import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:space_app/controller/planet_selector.dart';
import 'package:space_app/space_app.dart';
import 'package:flutter_inappwebview_ios/flutter_inappwebview_ios.dart';
import 'package:flutter_inappwebview_android/flutter_inappwebview_android.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InAppWebViewPlatform.instance =
      InAppWebViewPlatform.instance ?? AndroidInAppWebViewPlatform();
  InAppWebViewPlatform.instance = IOSInAppWebViewPlatform();

  runApp(
    ChangeNotifierProvider(
      create: (_) => PlanetSelector(),
      child: const SpaceApp(),
    ),
  );
}
