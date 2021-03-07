import 'dart:async';

import 'package:flutter/services.dart';

///
class Walle {
  const Walle._();

  static const MethodChannel _channel =
      MethodChannel('v7lin.github.io/walle_kit');

  /// 读取渠道ID
  static Future<String?> getChannelId() {
    return _channel.invokeMethod<String>('getChannelId');
  }
}
