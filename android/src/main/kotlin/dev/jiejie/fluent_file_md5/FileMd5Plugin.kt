package dev.jiejie.fluent_file_md5

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

class FileMd5Plugin: FlutterPlugin, Pigeon.FileMd5Api {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.FileMd5Api.setup(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.FileMd5Api.setup(binding.binaryMessenger, null)
  }

  override fun get(filePath: String): String {
    return getFileMd5(filePath)
  }

  override fun getSlice(filePath: String): String {
    return getFileSliceMd5(filePath)
  }
}
