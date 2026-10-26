import 'package:flutter/material.dart';
import 'package:space_app/core/assets_manager.dart';
import 'package:space_app/core/colors_manager.dart';
import 'package:space_app/view/home_screen.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetsManager.background, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorsManager.black.withValues(alpha: 0.35),
                  ColorsManager.black,
                ],
                stops: const [0.35, 0.72, 1],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 5),
                      const Text(
                        'Explore\nthe\nUniverse',
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 52,
                          height: 0.98,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 4),
                      Align(
                        alignment: Alignment.center,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 340),
                          child: CustomElevatedButton(
                            title: 'Explore',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                HomeScreen.routeName,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
