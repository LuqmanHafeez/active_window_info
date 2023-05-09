import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:active_window_info/active_window_info_method_channel.dart';

void main() {
  MethodChannelActiveWindowInfo platform = MethodChannelActiveWindowInfo();
  const MethodChannel channel = MethodChannel('active_window_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
