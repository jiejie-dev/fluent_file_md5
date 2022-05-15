#import "FileMd5Plugin.h"
#if __has_include(<fluent_file_md5/fluent_file_md5-Swift.h>)
#import <fluent_file_md5/fluent_file_md5-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fluent_file_md5-Swift.h"
#endif

@implementation FileMd5Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFileMd5Plugin registerWithRegistrar:registrar];
}
@end
