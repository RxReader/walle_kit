package io.github.v7lin.walle_kit;

import android.content.Context;

import androidx.annotation.NonNull;

import com.meituan.android.walle.WalleChannelReader;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * WalleKitPlugin
 */
public class WalleKitPlugin implements FlutterPlugin, MethodCallHandler {
    private Context applicationContext;
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "v7lin.github.io/walle_kit");
        channel.setMethodCallHandler(this);
        applicationContext = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        applicationContext = null;
    }

    // --- MethodCallHandler

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if ("getChannelId".equals(call.method)) {
            result.success(WalleChannelReader.getChannel(applicationContext));
        } else {
            result.notImplemented();
        }
    }
}
