#import "FlutterApplicationSettingsPlugin.h"
#import <flutter_application_settings/flutter_application_settings-Swift.h>

@implementation FlutterApplicationSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterApplicationSettingsPlugin registerWithRegistrar:registrar];
}
@end
