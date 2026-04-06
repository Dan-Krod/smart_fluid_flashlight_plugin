import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('toggleLight execution test', (WidgetTester tester) async {
    final result = await SmartFluidFlashlightPlugin.toggleLight();

    expect(result, isA<bool>());
  });
}
