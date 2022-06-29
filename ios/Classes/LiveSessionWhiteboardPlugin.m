#import "LiveSessionWhiteboardPlugin.h"
#if __has_include(<live_session_whiteboard/live_session_whiteboard-Swift.h>)
#import <live_session_whiteboard/live_session_whiteboard-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "live_session_whiteboard-Swift.h"
#endif

#import "FLNativeView.h"

@implementation LiveSessionWhiteboardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLiveSessionWhiteboardPlugin registerWithRegistrar:registrar];
  
  FLNativeViewFactory* factory =
      [[FLNativeViewFactory alloc] initWithMessenger:registrar.messenger];

  [registrar registerViewFactory:factory withId:@"whiteboard"];

}
@end
