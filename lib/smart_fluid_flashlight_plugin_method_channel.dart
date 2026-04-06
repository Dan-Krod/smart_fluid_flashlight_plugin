import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'smart_fluid_flashlight_plugin_platform_interface.dart';

/// An implementation of [SmartFluidFlashlightPluginPlatform] that uses method channels.
class MethodChannelSmartFluidFlashlightPlugin extends SmartFluidFlashlightPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('smart_fluid_flashlight_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
