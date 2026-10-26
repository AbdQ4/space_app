import 'package:flutter/material.dart';
import 'package:space_app/core/colors_manager.dart';

class ChangePlanetButton extends StatelessWidget {
  const ChangePlanetButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.red,
        foregroundColor: ColorsManager.white,
        disabledBackgroundColor: ColorsManager.red.withValues(alpha: 0.25),
        disabledForegroundColor: ColorsManager.white.withValues(alpha: 0.4),
        fixedSize: const Size.square(48),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
      child: Icon(icon, size: 20),
    );
  }
}
