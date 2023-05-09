import 'active_window_info_platform_interface.dart';

class ActiveWindowInfo {
  Future<String?> getPlatformVersion() {
    return ActiveWindowInfoPlatform.instance.getPlatformVersion();
  }

  Future<String?> getActiveWindowInfo() {
    return ActiveWindowInfoPlatform.instance.getActiveWindowInfo();
  }
}
