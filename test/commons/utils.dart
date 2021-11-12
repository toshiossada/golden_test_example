import 'package:flutter/cupertino.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<GoldenBuilder> builderGoldenTest() async {
  await loadAppFonts();
  return GoldenBuilder.grid(
    columns: 3,
    widthToHeightRatio: 1,
  );
}

extension GoldenTest on GoldenBuilder {
  Future<GoldenBuilder> addScenarioContextWithContext(
      String name, Widget Function(BuildContext context) fn) async {
    return this..addScenario(name, Builder(builder: fn));
  }
}
