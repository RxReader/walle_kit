#import "WalleKitPlugin.h"

@implementation WalleKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
        methodChannelWithName:@"v7lin.github.io/walle_kit"
              binaryMessenger:[registrar messenger]];
    WalleKitPlugin *instance = [[WalleKitPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getChannelId" isEqualToString:call.method]) {
        result(FlutterMethodNotImplemented);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
