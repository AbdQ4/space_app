import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/assets_manager.dart';
import 'package:space_app/view/home_screen.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AssetsManager.background,
                  fit: BoxFit.cover,
                  height: 733.h,
                ),
                Padding(
                  padding: REdgeInsets.only(left: 20, top: 250),
                  child: Text(
                    "Explore\nthe\nUniverse",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(left: 20, top: 670),
                  child: CustomElevatedButton(
                    title: "Explore",
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
