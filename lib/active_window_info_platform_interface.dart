import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'active_window_info_method_channel.dart';

abstract class ActiveWindowInfoPlatform extends PlatformInterface {
  /// Constructs a ActiveWindowInfoPlatform.
  ActiveWindowInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static ActiveWindowInfoPlatform _instance = MethodChannelActiveWindowInfo();

  /// The default instance of [ActiveWindowInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelActiveWindowInfo].
  static ActiveWindowInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ActiveWindowInfoPlatform] when
  /// they register themselves.
  static set instance(ActiveWindowInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    // throw UnimplementedError('platformVersion() has not been implemented.');
    return _instance.getPlatformVersion();
  }

  Future<String?> getActiveWindowInfo() {
    return _instance.getActiveWindowInfo();
  }
}
