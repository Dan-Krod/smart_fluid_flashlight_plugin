import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'smart_fluid_flashlight_plugin_method_channel.dart';

abstract class SmartFluidFlashlightPluginPlatform extends PlatformInterface {
  SmartFluidFlashlightPluginPlatform() : super(token: _token);

  static final Object _token = Object();
  static SmartFluidFlashlightPluginPlatform _instance =
      MethodChannelSmartFluidFlashlightPlugin();

  static SmartFluidFlashlightPluginPlatform get instance => _instance;

  static set instance(SmartFluidFlashlightPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> toggleLight() {
    throw UnimplementedError('toggleLight() has not been implemented.');
  }
}
