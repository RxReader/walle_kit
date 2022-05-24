import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:walle_kit/src/model/channel_info.dart';
import 'package:walle_kit/src/walle_kit_method_channel.dart';

void main() {
  final MethodChannelWalleKit platform = MethodChannelWalleKit();
  const MethodChannel channel = MethodChannel('v7lin.github.io/walle_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getChannelId':
          return 'official';
        case 'getChannelInfo':
          return <String, dynamic>{
            'channel': 'official',
          };
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getChannelId', () async {
    expect(await platform.getChannelId(), 'official');
  });

  test('getChannelInfo', () async {
    final ChannelInfo? info = await platform.getChannelInfo();
    expect(info?.channel, 'official');
  });
}
