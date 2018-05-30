//
//  AppDelegate.h
//  wave
//
//  Created by Armen Mkrtchyan on 5/29/18.
//  Copyright © 2018 Armen Mkrtchyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSDictionary *notificationUserInfo;
@property (nonatomic) BOOL shouldOpen;

+ (AppDelegate *)sharedDelegate;

- (BOOL)isApplicationInBackground;

@end

