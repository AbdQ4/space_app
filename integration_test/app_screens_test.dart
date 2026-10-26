import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:space_app/main.dart' as app;
import 'package:space_app/widgets/change_planet_button.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';

Future<void> _waitFor(WidgetTester tester, Finder finder) async {
  for (var attempt = 0; attempt < 80; attempt++) {
    if (finder.evaluate().isNotEmpty) return;
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('captures planet explorer screens', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await _waitFor(tester, find.text('Explore\nthe\nUniverse'));
    await tester.pumpAndSettle();

    expect(find.text('Explore\nthe\nUniverse'), findsOneWidget);
    await binding.takeScreenshot('01_intro');

    await tester.tap(find.byType(CustomElevatedButton));
    await tester.pumpAndSettle();
    await _waitFor(tester, find.text('Explore Sun'));
    await tester.pumpAndSettle();

    expect(
      find.text('Which planet\nwould you like to explore?'),
      findsOneWidget,
    );
    await binding.takeScreenshot('02_home');

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byType(ChangePlanetButton).last);
      await tester.pumpAndSettle();
    }

    expect(find.text('Earth'), findsOneWidget);
    expect(find.text('Explore Earth'), findsOneWidget);
    await binding.takeScreenshot('03_earth');

    await tester.tap(find.text('Explore Earth'));
    await tester.pumpAndSettle();
    await _waitFor(tester, find.text('About'));
    await Future<void>.delayed(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.textContaining('Earth: Our Home Planet'), findsOneWidget);

    await tester.drag(find.text('About'), const Offset(0, -620));
    await tester.pumpAndSettle();
    expect(find.text('Surface area'), findsOneWidget);
    await binding.takeScreenshot('05_details_facts');
  });
}
