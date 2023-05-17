import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:iat_example/main.dart';

Future<void> theAppIsRendered(WidgetTester tester) async {
  await loadAppFonts();

  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(devices: [Device.iphone11])
    ..addScenario(
      widget: const ProviderScope(
        child: MyApp(),
      ),
    );

  await tester.pumpDeviceBuilder(builder);
}
