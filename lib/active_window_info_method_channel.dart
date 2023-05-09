import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:win32/win32.dart';
import 'active_window_info_platform_interface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

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
    late final String activeWindowInfo;
    if (Platform.isWindows) {
      final hWnd = GetForegroundWindow();
      const maxCount = 1024;
      final buffer = malloc.allocate<Utf16>(maxCount);
      final length = GetWindowText(hWnd, buffer, maxCount);
      final result = buffer.cast<Utf16>().toDartString(length: length);
      calloc.free(buffer);
      activeWindowInfo = result;
    } else {
      activeWindowInfo =
          await methodChannel.invokeMethod('getActiveWindowInfo');
    }

    return activeWindowInfo;
  }
}
