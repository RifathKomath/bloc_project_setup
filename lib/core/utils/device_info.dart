// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/services.dart';

// Future<String?> getDeviceId() async {
//   final deviceInfo = DeviceInfoPlugin();

//   if (Platform.isAndroid) {
//     final androidInfo = await deviceInfo.androidInfo;
//     return androidInfo.id;
//   } else if (Platform.isIOS) {
//     final iosInfo = await deviceInfo.iosInfo;
//     return iosInfo.identifierForVendor;
//   }

//   return null;
// }



 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DeviceUtils {
  static const platform = MethodChannel('unique_device_id');

  static Future<String> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final String androidId = await platform.invokeMethod('getAndroidId');
        debugPrint("Device ID: $androidId");
        return androidId;
      } else if (Platform.isIOS) {
        // You can implement a similar iOS method if needed.
        return "unsupported_platform_ios";
      } else {
        return "unsupported_platform";
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get Device ID: ${e.message}");
      return "unknown_device_id";
    }
  }
}
