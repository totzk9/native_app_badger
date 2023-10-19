import 'package:flutter_test/flutter_test.dart';
import 'package:native_app_badger/native_app_badger.dart';
import 'package:native_app_badger/native_app_badger_platform_interface.dart';
import 'package:native_app_badger/native_app_badger_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeAppBadgerPlatform
    with MockPlatformInterfaceMixin
    implements NativeAppBadgerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeAppBadgerPlatform initialPlatform = NativeAppBadgerPlatform.instance;

  test('$MethodChannelNativeAppBadger is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeAppBadger>());
  });

  test('getPlatformVersion', () async {
    NativeAppBadger nativeAppBadgerPlugin = NativeAppBadger();
    MockNativeAppBadgerPlatform fakePlatform = MockNativeAppBadgerPlatform();
    NativeAppBadgerPlatform.instance = fakePlatform;

    expect(await nativeAppBadgerPlugin.getPlatformVersion(), '42');
  });
}
