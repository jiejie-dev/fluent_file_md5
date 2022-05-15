flutter pub run pigeon \
  --input pigeons/interface.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Classes/pigeon.h \
  --objc_source_out ios/Classes/pigeon.m \
  --java_out ./android/src/main/java/com/mashangjiama/pigeon/Pigeon.java \
  --java_package "dev.jiejie.pigeon.fluent_file_md5"