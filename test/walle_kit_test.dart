import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:walle_kit/src/model/channel_info.dart';
import 'package:walle_kit/src/walle.dart';
import 'package:walle_kit/src/walle_kit_method_channel.dart';
import 'package:walle_kit/src/walle_kit_platform_interface.dart';

class MockWalleKitPlatform
    with MockPlatformInterfaceMixin
    implements WalleKitPlatform {
  @override
  Future<String?> getChannelId() {
    return Future<String?>.value('official');
  }

  @override
  Future<ChannelInfo?> getChannelInfo() {
    return Future<ChannelInfo?>.value(ChannelInfo(channel: 'official'));
  }
}

void main() {
  final WalleKitPlatform initialPlatform = WalleKitPlatform.instance;

  test('$MethodChannelWalleKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWalleKit>());
  });

  test('getChannelId', () async {
    final MockWalleKitPlatform fakePlatform = MockWalleKitPlatform();
    WalleKitPlatform.instance = fakePlatform;

    expect(await Walle.instance.getChannelId(), 'official');
  });

  test('getChannelInfo', () async {
    final MockWalleKitPlatform fakePlatform = MockWalleKitPlatform();
    WalleKitPlatform.instance = fakePlatform;

    final ChannelInfo? info = await Walle.instance.getChannelInfo();
    expect(info?.channel, 'official');
  });
}
