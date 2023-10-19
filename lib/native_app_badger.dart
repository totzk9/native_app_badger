import 'package:flutter/services.dart';

class NativeAppBadger {
  static const MethodChannel _channel = MethodChannel('ph/native_app_badger');

  static Future<void> updateBadgeCount(int count) async {
    return _channel.invokeMethod(
      'updateBadgeCount',
      <String, int>{
        'count': count,
      },
    );
  }

  static Future<void> removeBadge() async {
    return _channel.invokeMethod('removeBadge');
  }

  static Future<bool> isAppBadgeSupported() async {
    final bool? isAppBadgeSupported =
        await _channel.invokeMethod('isAppBadgeSupported');
        
    return isAppBadgeSupported ?? false;
  }
}
