import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class WalleKit {
  static const MethodChannel _channel = MethodChannel('v7lin.github.io/walle_kit');

  static Future<String> getChannelId() async {
    assert(Platform.isAndroid);
    final String version = await _channel.invokeMethod('getChannelId');
    return version;
  }
}
