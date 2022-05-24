import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:walle_kit/src/model/channel_info.dart';
import 'package:walle_kit/src/walle_kit_method_channel.dart';

abstract class WalleKitPlatform extends PlatformInterface {
  /// Constructs a WalleKitPlatform.
  WalleKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static WalleKitPlatform _instance = MethodChannelWalleKit();

  /// The default instance of [WalleKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelWalleKit].
  static WalleKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WalleKitPlatform] when
  /// they register themselves.
  static set instance(WalleKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getChannelId() {
    throw UnimplementedError('getChannelId() has not been implemented.');
  }

  Future<ChannelInfo?> getChannelInfo() {
    throw UnimplementedError('getChannelInfo() has not been implemented.');
  }
}
