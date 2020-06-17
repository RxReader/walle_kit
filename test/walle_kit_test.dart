import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:walle_kit/walle_kit.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('walle_kit');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'getChannelId':
          return 'huawei';
      }
      throw PlatformException(code: '0', message: '想啥呢，升级插件不想升级Mock？');
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getChannelId', () async {
    expect(await Walle.getChannelId(), 'huawei');
  });
}
