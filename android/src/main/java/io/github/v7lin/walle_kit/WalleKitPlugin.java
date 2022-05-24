package io.github.v7lin.walle_kit;

import android.content.Context;

import androidx.annotation.NonNull;

import com.meituan.android.walle.ChannelInfo;
import com.meituan.android.walle.WalleChannelReader;

import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * WalleKitPlugin
 */
public class WalleKitPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context applicationContext;

    // --- FlutterPlugin

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
        } else if ("getChannelInfo".equals(call.method)) {
            final ChannelInfo info = WalleChannelReader.getChannelInfo(applicationContext);
            result.success(info != null ? new HashMap<String, Object>() {
                {
                    put("channel", info.getChannel());
                    put("extra_info", info.getExtraInfo());
                }
            } : null);
        } else {
            result.notImplemented();
        }
    }
}
