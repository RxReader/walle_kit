import 'dart:async';

import 'package:flutter/services.dart';

class WalleKit {
  static const MethodChannel _channel =
      const MethodChannel('walle_kit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
