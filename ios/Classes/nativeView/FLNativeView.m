#import "FLNativeView.h"

#import "../Agora/Whiteboard/Classes/Whiteboard.h"

@implementation FLNativeViewFactory {
  NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  if (self) {
    _messenger = messenger;
  }
  return self;
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
  return [[FLNativeView alloc] initWithFrame:frame
                              viewIdentifier:viewId
                                   arguments:args
                             binaryMessenger:_messenger];
}

@end

@implementation FLNativeView {
   UIView *_view;
}

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    _view = [[UIView alloc] init];
    [ self createNativeView:_view ];
  return self;
}

- (UIView*)view {
  return _view;
}

- (void) createNativeView:(UIView*) view {

    // TestHeaderFile *testHeaderFile = [[TestHeaderFile alloc] init];
    // NSString *s = [testHeaderFile someFunction];
    
    // if([@"green" isEqualToString:s]){
    // view.backgroundColor = [UIColor redColor];
        
    // }else{
        view.backgroundColor = [UIColor greenColor];
    // }
    
}

@end
