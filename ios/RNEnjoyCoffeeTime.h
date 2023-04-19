//
//  RNEnjoyCoffeeTime.h
//  RNTheCoffeeTime
//
//  Created by Denica on 4/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNEnjoyCoffeeTime : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)coffeeTime_shared;
- (BOOL)coffeeTime_enjoyThisWay;
- (UIInterfaceOrientationMask)coffeeTime_getOrientation;
- (UIViewController *)coffeeTime_tasteDifferentFlavorsChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
