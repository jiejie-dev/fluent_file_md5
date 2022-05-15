import 'dart:async';
import 'dart:io';

import 'package:fluent_file_md5/file_md5.dart';
import 'package:file_md5_example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> copyAssetFileToTempDirectory(String assetFilePath) async {
  try {
    final tempDirectory = await getTemporaryDirectory();
    final tempFilePath = join(tempDirectory.path, basename(assetFilePath));
    final assetData = await rootBundle.load(assetFilePath);
    final assetBytes = assetData.buffer
        .asUint8List(assetData.offsetInBytes, assetData.lengthInBytes);
    await File(tempFilePath).writeAsBytes(assetBytes, flush: true);
    return tempFilePath;
  } catch (_) {
    return null;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _fileChecksum = "---";

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final tempFilePath =
          await copyAssetFileToTempDirectory(Assets.file1) ?? "";
      final fileChecksum = await FileMd5.get(filePath: tempFilePath);

      if (!mounted) return;
      setState(() {
        _fileChecksum = fileChecksum;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('File checksum: $_fileChecksum'),
        ),
      ),
    );
  }
}
