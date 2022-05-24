import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:walle_kit/src/model/channel_info.dart';
import 'package:walle_kit/src/walle_kit_platform_interface.dart';

/// An implementation of [WalleKitPlatform] that uses method channels.
class MethodChannelWalleKit extends WalleKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('v7lin.github.io/walle_kit');

  @override
  Future<String?> getChannelId() {
    assert(
        Platform.isAndroid || Platform.environment['FLUTTER_TEST'] == 'true');
    return methodChannel.invokeMethod<String>('getChannelId');
  }

  @override
  Future<ChannelInfo?> getChannelInfo() async {
    assert(
        Platform.isAndroid || Platform.environment['FLUTTER_TEST'] == 'true');
    final Map<String, dynamic>? json =
        await methodChannel.invokeMapMethod<String, dynamic>('getChannelInfo');
    return json != null ? ChannelInfo.fromJson(json) : null;
  }
}
