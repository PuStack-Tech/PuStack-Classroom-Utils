#import "FLNativeView.h"
#import "NETURLSchemeHandler.h"
#import "Masonry.h"
#import "TestHeaderFile.h"

#import "Whiteboard/Classes/Whiteboard.h"
#import "Whiteboard/Classes/Whiteboard_Example-swift.h"

@implementation FLNativeViewFactory {
  NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  if (self) {
    _messenger = messenger;
  }
  return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
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

// variables
NETURLSchemeHandler *_schemeHandler API_AVAILABLE(ios(11.0));
NSString *_roomUuid;
WhiteBoardView *_boardView;
WhiteSDK *_sdk;
BOOL _useMultiViews = false;
ExampleControlView *_controlView;
WhiteSdkConfiguration *_sdkConfig;
id<WhiteCommonCallbackDelegate> _commonDelegate;
id<WhiteRoomCallbackDelegate> _roomCallbackDelegate;

NSString *_apiHost = @"https://api.netless.link/v5/";
NSString *_whiteboardAppId = @"VHBvQEEXEeuIHrEufR7KaQ/Ve4pIDeMRzIvRQ";
NSString *_roomToken = @"NETLESSROOM_YWs9X3ZMZmdPeGtJelhhM1VENyZub25jZT0xNjQ2NDc2MjkzNzkwMDAmcm9sZT0yJnNpZz1hM2M1YjZmODdlOTI4MTEyNTVlNmFjMmQ1YWZhNTE3NGUyYTJkN2I0ZDdmMDQ0NDhlNThlNTg2NzYzNGY3ZGFmJnV1aWQ9MjlkNmViNjA5YzZhMTFlY2IzMDQ0MWI1Y2ZlZjYwZDQ";
NSString *_roomId = @"29d6eb609c6a11ecb30441b5cfef60d4";
NSString *_uuid = @"iodiod";

BOOL _reconnecting;
WhiteRoomConfig *_roomConfig;
// This textview was simply used for debugging
UITextView *myTextView;

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    _view = [[UIView alloc] init];

    _uuid = args[@"uid"];
    _roomId = args[@"room_id"];
    _roomToken = args[@"room_token"];
    _whiteboardAppId = args[@"whiteboard_app_id"];


    [ self createNativeView:_view ];

  return self;
}

- (UIView*)view {
  return _view;
}

- (void) createNativeView:(UIView*) view {

    TestHeaderFile *testHeaderFile = [[TestHeaderFile alloc] init];
    NSString *s = [testHeaderFile someFunction];
    
   
    // view.backgroundColor = [UIColor greenColor];

    myTextView = [[UITextView alloc] init];
    // myTextView.text = @"This will be a long text with ";
    // [self.view addSubview:myTextView];
    // [myTextView sizeToFit];

    [self initializeSdkConfig];
    [self setupViews];
    [self initSDK];
    [self _joinRoomWithToken:_roomToken];

    // join room
}

// setup views
- (void)setupViews {
  static NSString *kPPTScheme = @"netless";
    
    if (@available(iOS 11, *)) {
        // 在初始化 sdk 时，配置 PPTParams 的 scheme，保证与此处传入的 scheme 一致。
        _schemeHandler = [[NETURLSchemeHandler alloc] initWithScheme:kPPTScheme directory:NSTemporaryDirectory()];
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        [config setURLSchemeHandler:_schemeHandler forURLScheme:kPPTScheme];
        _boardView = [[WhiteBoardView alloc] initWithFrame:CGRectZero configuration:config];
    } else {
        _boardView = [[WhiteBoardView alloc] init];
    }
    [self.view addSubview:_boardView];

    [_boardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).inset(0);
        make.left.right.equalTo(self.view).inset(0);
        make.height.equalTo(_boardView.mas_width).multipliedBy(9.0 / 16.0);
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame) name:@"changeframe" object:nil];
}

- (WhiteSdkConfiguration *)initializeSdkConfig
{
  
    if (!_sdkConfig) {
        // 4. 初始化 SDK 配置项，根据需求配置属性
        WhiteSdkConfiguration *config = [[WhiteSdkConfiguration alloc] initWithApp:_whiteboardAppId];
        config.renderEngine = WhiteSdkRenderEngineCanvas;
        config.useMultiViews = _useMultiViews;
        
        config.log = YES;
        config.region = WhiteRegionCN;
        config.enableIFramePlugin = YES;
        
        //打开用户头像显示信息
        config.userCursor = YES;
        _sdkConfig = config;
    }
    return _sdkConfig;
}


- (void)initSDK {
    // 5.初始化 SDK，传入 commomDelegate
    _sdk = [[WhiteSDK alloc] initWithWhiteBoardView:_boardView config:_sdkConfig commonCallbackDelegate:_commonDelegate];
}


- (void) _joinRoomWithToken:(NSString *)roomToken
{
    // comment
    WhiteRoomConfig *roomConfig = [[WhiteRoomConfig alloc] initWithUUID:_roomId roomToken:roomToken uid: _uuid userPayload:nil];

    WhiteCameraBound *bound = [WhiteCameraBound defaultMinContentModeScale:0 maxContentModeScale:10];
    roomConfig.cameraBound = bound;
    roomConfig.region = WhiteRegionCN;
    [roomConfig setIsWritable:false];

    _roomConfig = roomConfig;
    
    [_sdk joinRoomWithConfig:_roomConfig callbacks:nil completionHandler:^(BOOL success, WhiteRoom * _Nonnull room, NSError * _Nonnull error) {
        if (success) {
            [self _actionAfterSuccessJoinRoom:room roomToken:roomToken];
        }
        else {
            [self _defaultActionAfterJoinRoomError:error];
    }}];
}

- (void) _actionAfterSuccessJoinRoom:(WhiteRoom *)room roomToken:(NSString *)roomToken
{
    _roomToken = roomToken;
    // [self view].backgroundColor = [UIColor blueColor];
}

- (void)_defaultActionAfterJoinRoomError:(NSError *)error
{
    // [self view].backgroundColor = [UIColor redColor];
    // myTextView.text = error.description;
}

@end
