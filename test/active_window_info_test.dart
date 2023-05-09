import 'package:flutter_test/flutter_test.dart';
import 'package:active_window_info/active_window_info.dart';
import 'package:active_window_info/active_window_info_platform_interface.dart';
import 'package:active_window_info/active_window_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockActiveWindowInfoPlatform
    with MockPlatformInterfaceMixin
    implements ActiveWindowInfoPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ActiveWindowInfoPlatform initialPlatform =
      ActiveWindowInfoPlatform.instance;

  test('$MethodChannelActiveWindowInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelActiveWindowInfo>());
  });

  test('getPlatformVersion', () async {
    ActiveWindowInfo activeWindowInfoPlugin = ActiveWindowInfo();
    MockActiveWindowInfoPlatform fakePlatform = MockActiveWindowInfoPlatform();
    ActiveWindowInfoPlatform.instance = fakePlatform;

    expect(await activeWindowInfoPlugin.getPlatformVersion(), '42');
  });
}
