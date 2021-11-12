import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goldentest/home_page.dart';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:goldentest/widgets/custom_textbox_widget.dart';

void main() {
  testGoldens('Warning Color', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..addScenario(
        name: 'No Text',
        widget: const HomePage(),
      )
      ..addScenario(
        name: 'Password Hided',
        widget: const HomePage(),
        onCreate: (scenarioWidgetKey) async {
          final txt = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(const Key('txtPassword')));
          expect(txt, findsWidgets);
          await tester.enterText(txt.first, '123');
        },
      )
      ..addScenario(
        name: 'Password Showed',
        widget: const HomePage(),
        onCreate: (scenarioWidgetKey) async {
          final txt = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(const Key('txtPassword')));
          expect(txt, findsWidgets);
          final icon =
              find.descendant(of: txt, matching: find.byType(IconButton));

          expect(icon, findsOneWidget);
          await tester.enterText(txt.first, '123');
          await tester.tap(icon);
        },
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'Home Screen');
  });
}
