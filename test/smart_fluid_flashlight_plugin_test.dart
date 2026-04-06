import 'package:flutter_test/flutter_test.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin_platform_interface.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSmartFluidFlashlightPluginPlatform
    with MockPlatformInterfaceMixin
    implements SmartFluidFlashlightPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SmartFluidFlashlightPluginPlatform initialPlatform = SmartFluidFlashlightPluginPlatform.instance;

  test('$MethodChannelSmartFluidFlashlightPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSmartFluidFlashlightPlugin>());
  });

  test('getPlatformVersion', () async {
    SmartFluidFlashlightPlugin smartFluidFlashlightPlugin = SmartFluidFlashlightPlugin();
    MockSmartFluidFlashlightPluginPlatform fakePlatform = MockSmartFluidFlashlightPluginPlatform();
    SmartFluidFlashlightPluginPlatform.instance = fakePlatform;

    expect(await smartFluidFlashlightPlugin.getPlatformVersion(), '42');
  });
}
