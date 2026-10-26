import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/colors_manager.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';
import 'package:space_app/widgets/header.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)!.settings.arguments as PlanetModel;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Header(title: planet.planetName),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.title,
                        style: const TextStyle(
                          color: ColorsManager.white,
                          fontSize: 24,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: Flutter3DViewer(src: planet.modelPath),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'About',
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        planet.about,
                        style: TextStyle(
                          color: ColorsManager.white.withValues(alpha: 0.82),
                          fontSize: 16,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _PlanetFact(
                        label: 'Distance from Sun',
                        value: _formatValue(planet.distanceFromSun, 'km'),
                      ),
                      _PlanetFact(
                        label: 'Length of day',
                        value: _formatValue(planet.lengthOfDay, 'hours'),
                      ),
                      _PlanetFact(
                        label: 'Orbital period',
                        value: _formatValue(
                          planet.orbitalPeriod,
                          planet.orbitalPeriod == 1
                              ? 'Earth year'
                              : 'Earth years',
                        ),
                      ),
                      _PlanetFact(
                        label: 'Radius',
                        value: _formatValue(planet.radius, 'km'),
                      ),
                      _PlanetFact(label: 'Mass', value: '${planet.mass} kg'),
                      _PlanetFact(
                        label: 'Gravity',
                        value: '${planet.gravity} m/s²',
                      ),
                      _PlanetFact(
                        label: 'Surface area',
                        value: '${planet.surfaceArea} km²',
                      ),
                      const SizedBox(height: 24),
                      CustomElevatedButton(
                        title: 'Go back',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatValue(double value, String unit) {
  if (value == 0) return '—';
  final number = value == value.roundToDouble()
      ? value.round().toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (_) => ',',
        )
      : value.toString();
  return '$number $unit';
}

class _PlanetFact extends StatelessWidget {
  const _PlanetFact({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  label,
                  style: TextStyle(
                    color: ColorsManager.white.withValues(alpha: 0.6),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: ColorsManager.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: ColorsManager.white.withValues(alpha: 0.08),
        ),
      ],
    );
  }
}
