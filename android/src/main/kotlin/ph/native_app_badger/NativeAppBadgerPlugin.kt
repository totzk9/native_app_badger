package ph.native_app_badger

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import me.leolin.shortcutbadger.ShortcutBadger

/** NativeAppBadgerPlugin */
class NativeAppBadgerPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    private val channelName: String = "ph/native_app_badger"

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.getApplicationContext()

    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method.equals("updateBadgeCount")) {
            ShortcutBadger.applyCount(
                context,
                Integer.valueOf(call.argument("count").toString())
            )
            result.success(null)
        } else if (call.method.equals("removeBadge")) {
            ShortcutBadger.removeCount(context)
            result.success(null)
        } else if (call.method.equals("isAppBadgeSupported")) {
            result.success(ShortcutBadger.isBadgeCounterSupported(context))
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
