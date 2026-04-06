import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSmartFluidFlashlightPlugin platform = MethodChannelSmartFluidFlashlightPlugin();
  const MethodChannel channel = MethodChannel('smart_fluid_flashlight_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
