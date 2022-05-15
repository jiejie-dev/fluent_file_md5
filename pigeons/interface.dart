import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class FileMd5Api {
  String get(
    String filePath,
  );

  String getSlice(
    String filePath,
  );
}
