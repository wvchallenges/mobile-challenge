//
//  Constants.h
//  Core
//
//  Created by Armen on 9/22/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import <Foundation/Foundation.h>

// Configurations

extern NSString *const BaseServerURL;
extern NSString *const WaveAccessToken;
extern NSString *const WaveBusinessId;

extern NSUInteger SyncTime;

// Realm
extern NSInteger const RealmMigrationSchemeVersion;

// Other constants
extern NSString *const kHTTPResponseDomain;
extern NSString *const kErrorMessageNoConnection;
extern NSString *const kErrorMessageNoServer;
extern NSString *const kErrorMessageUnknown;

// NSUserDefaults keys
extern NSString *const kTokenExpired;

// NSNotification names
extern NSString *const NotificationSyncData;
extern NSString *const NotificationCancelSync;
extern NSString *const NotificationRefreshData;
extern NSString *const NotificationTokenExpired;

// Sync data names
extern NSString *const SyncDataProduct;

// Empty screen messages
extern NSString *const EmptyList;

#define NANO_SECS_PER_SEC 1000000000

#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#elif TESTING
#   define NSLog(...) NSLog(__VA_ARGS__)
#else
#   define NSLog(...)
#endif


#define kScreenBounds  [ [ UIScreen mainScreen ] bounds ]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define FontMacro(_name_, _size_) ((UIFont *)[UIFont fontWithName:(NSString *)(_name_) size:(CGFloat)(_size_)])

#define objectOrNull(object) object ? object : [NSNull null]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
