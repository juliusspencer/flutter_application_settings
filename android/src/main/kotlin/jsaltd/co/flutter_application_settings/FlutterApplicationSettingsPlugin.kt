package jsaltd.co.flutter_application_settings

import android.app.Activity
import android.app.Application
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS


class FlutterApplicationSettingsPlugin(activity: Activity, channel: MethodChannel) : MethodCallHandler {

    private var methodChannel: MethodChannel = channel
    private var context: Activity = activity

    init {
        this.methodChannel.setMethodCallHandler(this)
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_application_settings")
            channel.setMethodCallHandler(FlutterApplicationSettingsPlugin(registrar.activity(), channel))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "viewAppSettings") {
            val i = Intent()
            i.action = ACTION_APPLICATION_DETAILS_SETTINGS
            i.addCategory(Intent.CATEGORY_DEFAULT)
            i.data = Uri.parse("package:" + context.packageName)
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            i.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
            i.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS)
            context.startActivity(i)
        } else {
            result.notImplemented()
        }
    }
}
