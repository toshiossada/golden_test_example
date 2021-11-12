import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:goldentest/widgets/custom_textbox_widget.dart';

void main() {
  testGoldens('Primary Color', (tester) async {
    await loadAppFonts();

    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
    )
      ..addScenario(
        "Password Empty",
        const CustomTextWidget(obscureText: true),
      )
      ..addScenario(
        "Password Hided",
        const CustomTextWidget(obscureText: true, initialValue: 'Teste'),
      )
      ..addScenario(
        "Password Showed",
        const CustomTextWidget(obscureText: false, initialValue: 'Teste'),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'password-input');
  });
}
