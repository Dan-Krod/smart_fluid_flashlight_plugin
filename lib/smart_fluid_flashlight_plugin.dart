
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmartFluidFlashlightPlugin {
  static const MethodChannel _channel = MethodChannel(
    'smart_fluid_flashlight_plugin',
  );

  static Future<bool> toggleLight() async {
    try {
      final bool? result = await _channel.invokeMethod<bool>('toggleLight');
      return result ?? false;
    } on PlatformException catch (e) {
      debugPrint("Failed to toggle light: '${e.message}'.");
      return false;
    }
  }
}
