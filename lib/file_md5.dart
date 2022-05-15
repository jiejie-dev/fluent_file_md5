import 'dart:async';
import 'dart:io';

import 'pigeon.dart';

class FileMd5 {
  static late final _api = FileMd5Api();

  /// Calculates the MD5 checksum of a file
  ///
  /// - [filePath]: Absolute file path
  ///
  /// Throws a [FileSystemException] if the file does not exist.
  /// Throws a [PlatformException] if some other error occurs.
  static Future<String> get({
    required String filePath,
  }) async {
    final fileExists = File(filePath).existsSync();
    if (!fileExists) throw FileSystemException("File does not exist", filePath);

    return await _api.get(filePath);
  }

  static Future<String> getSlice({
    required String filePath,
  }) async {
    final fileExists = File(filePath).existsSync();
    if (!fileExists) throw FileSystemException("File does not exist", filePath);

    return await _api.getSlice(filePath);
  }
}
