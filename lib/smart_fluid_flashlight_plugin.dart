
import 'smart_fluid_flashlight_plugin_platform_interface.dart';

class SmartFluidFlashlightPlugin {
  Future<String?> getPlatformVersion() {
    return SmartFluidFlashlightPluginPlatform.instance.getPlatformVersion();
  }
}
