import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'active_window_info_platform_interface.dart';

/// An implementation of [ActiveWindowInfoPlatform] that uses method channels.
class MethodChannelActiveWindowInfo extends ActiveWindowInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('active_window_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getActiveWindowInfo() async {
    final String activeWindowInfo =
        await methodChannel.invokeMethod('getActiveWindowInfo');
    return activeWindowInfo;
  }
}
