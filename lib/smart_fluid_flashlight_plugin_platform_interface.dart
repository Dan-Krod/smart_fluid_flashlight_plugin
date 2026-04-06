import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'smart_fluid_flashlight_plugin_method_channel.dart';

abstract class SmartFluidFlashlightPluginPlatform extends PlatformInterface {
  /// Constructs a SmartFluidFlashlightPluginPlatform.
  SmartFluidFlashlightPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SmartFluidFlashlightPluginPlatform _instance = MethodChannelSmartFluidFlashlightPlugin();

  /// The default instance of [SmartFluidFlashlightPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSmartFluidFlashlightPlugin].
  static SmartFluidFlashlightPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SmartFluidFlashlightPluginPlatform] when
  /// they register themselves.
  static set instance(SmartFluidFlashlightPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
