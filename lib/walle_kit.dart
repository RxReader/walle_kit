import 'dart:async';

import 'package:flutter/services.dart';

class WalleKit {
  static const MethodChannel _channel =
      MethodChannel('v7lin.github.io/walle_kit');

  static Future<String> getChannelId() async {
    final String version = await _channel.invokeMethod('getChannelId');
    return version;
  }
}
