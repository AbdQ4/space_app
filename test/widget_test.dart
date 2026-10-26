import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:space_app/controller/planet_selector.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/space_app.dart';
import 'package:space_app/view/home_screen.dart';
import 'package:space_app/widgets/change_planet_button.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';

Future<void> _pumpSpaceApp(
  WidgetTester tester, {
  Size size = const Size(402, 874),
}) async {
  await tester.binding.setSurfaceSize(size);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (_) => PlanetSelector(),
      child: const SpaceApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _pumpHome(WidgetTester tester, PlanetSelector selector) async {
  await tester.binding.setSurfaceSize(const Size(402, 874));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ChangeNotifierProvider.value(
      value: selector,
      child: const MaterialApp(home: HomeScreen()),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('PlanetModel', () {
    test('exposes the solar system in orbit order', () {
      expect(PlanetModel.planets.map((planet) => planet.planetName), [
        'Sun',
        'Mercury',
        'Venus',
        'Earth',
        'Mars',
        'Jupiter',
        'Saturn',
        'Uranus',
        'Neptune',
      ]);
    });

    test('provides facts and assets for every body', () {
      for (final planet in PlanetModel.planets) {
        expect(planet.title, isNotEmpty);
        expect(planet.about, isNotEmpty);
        expect(planet.imagePath, startsWith('assets/images/'));
        expect(planet.modelPath, startsWith('assets/3d_models/'));
        expect(planet.radius, greaterThan(0));
        expect(planet.mass, isNotEmpty);
      }
    });
  });

  group('PlanetSelector', () {
    test('updates the selected planet', () {
      final selector = PlanetSelector();

      selector.selectPlanet(4);

      expect(selector.selectedIndex, 4);
    });

    test('ignores out-of-range selections', () {
      final selector = PlanetSelector();

      selector.selectPlanet(-1);
      selector.selectPlanet(PlanetModel.planets.length);

      expect(selector.selectedIndex, 0);
    });
  });

  testWidgets('intro opens the planet explorer', (tester) async {
    await _pumpSpaceApp(tester);

    expect(find.text('Explore\nthe\nUniverse'), findsOneWidget);
    expect(find.byType(CustomElevatedButton), findsOneWidget);

    await tester.tap(find.byType(CustomElevatedButton));
    await tester.pumpAndSettle();

    expect(
      find.text('Which planet\nwould you like to explore?'),
      findsOneWidget,
    );
    expect(find.text('Explore Sun'), findsOneWidget);
  });

  testWidgets('planet arrows move between worlds', (tester) async {
    final selector = PlanetSelector();
    await _pumpHome(tester, selector);

    expect(find.text('Sun'), findsOneWidget);
    expect(find.text('Explore Sun'), findsOneWidget);

    await tester.tap(find.byType(ChangePlanetButton).last);
    await tester.pumpAndSettle();

    expect(selector.selectedIndex, 1);
    expect(find.text('Mercury'), findsOneWidget);
    expect(find.text('Explore Mercury'), findsOneWidget);

    await tester.tap(find.byType(ChangePlanetButton).first);
    await tester.pumpAndSettle();

    expect(selector.selectedIndex, 0);
    expect(find.text('Sun'), findsOneWidget);
  });

  testWidgets('compact screens remain overflow-free', (tester) async {
    await _pumpSpaceApp(tester, size: const Size(320, 568));

    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(CustomElevatedButton));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Explore Sun'), findsOneWidget);
  });
}
