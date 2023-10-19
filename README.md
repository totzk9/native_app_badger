# Native App Badger plugin

A Flutter plugin for managing app icon badges.

## Getting Started

### iOS

On iOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Please also add the following to your YOUR_PROJECT/ios/Runner/Info.plist:
```xml
<key>UIBackgroundModes</key>
<array>
    <string>remote-notification</string>
</array>
```

#### Other info

iOS 16+ uses `UNUserNotificationCenter.setBadgeCount`
iOS 15 and below uses `UIApplication.applicationIconBadgeNumber`

## macOS

On macOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Please also add the following to your YOUR_PROJECT/macos/Runner/Info.plist:
```xml
<key>NSUserNotificationAlertStyle</key>
<string>banner</string>
```

### Android

On Android, we are using [ShortcutBadgerX library](https://github.com/rlgo/ShortcutBadgerX) which supports 19 launchers.


### Dart

import the package in your dart files with:
```dart
import 'package:native_app_badger/flutter_app_badger.dart';
```

Add badge:
```dart
NativeAppBadger.updateBadgeCount(1);
```

Remove the badge or reset to 0:
```dart
NativeAppBadger.removeBadge();
```

You can check if the current device supports badges:
```dart
NativeAppBadger.isAppBadgeSupported();
```