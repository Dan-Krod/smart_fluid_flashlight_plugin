import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'smart_fluid_flashlight_plugin_platform_interface.dart';

class MethodChannelSmartFluidFlashlightPlugin
    extends SmartFluidFlashlightPluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('smart_fluid_flashlight_plugin');

  @override
  Future<bool> toggleLight() async {
    final bool? result = await methodChannel.invokeMethod<bool>('toggleLight');
    return result ?? false;
  }
}
