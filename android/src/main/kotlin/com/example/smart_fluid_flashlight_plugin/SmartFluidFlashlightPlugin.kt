package com.example.smart_fluid_flashlight_plugin

import android.content.Context
import android.hardware.camera2.CameraManager
import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class SmartFluidFlashlightPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private var isFlashOn = false 

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "smart_fluid_flashlight_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "toggleLight") {
      val success = toggleFlashlight()
      result.success(success)
    } else {
      result.notImplemented()
    }
  }

  private fun toggleFlashlight(): Boolean {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      try {
        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList[0] 
        isFlashOn = !isFlashOn
        cameraManager.setTorchMode(cameraId, isFlashOn)
        return isFlashOn
      } catch (e: Exception) {
        e.printStackTrace()
      }
    }
    return false
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
