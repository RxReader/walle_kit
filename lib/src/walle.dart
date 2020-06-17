import 'dart:async';

import 'package:flutter/services.dart';

class Walle {
  Walle._();

  static const MethodChannel _channel =
      MethodChannel('v7lin.github.io/walle_kit');

  /// 读取渠道ID
  static Future<String> getChannelId() async {
    final String version = await _channel.invokeMethod('getChannelId');
    return version;
  }
}
