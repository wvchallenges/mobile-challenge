//
//  Constants.m
//  Core
//
//  Created by Armen on 9/22/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "Constants.h"

#ifdef DEBUG
#define API_URL              @"https://api-waveapps-com-46xppbr4mlmt.runscope.net/"

#elif TESTING
#define API_URL              @"https://api.waveapps.com/"

#elif PRODUCTION
#define API_URL              @"https://api.waveapps.com/"

#endif

NSString *const BaseServerURL = API_URL;
NSString *const WaveAccessToken = @"6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";
NSString *const WaveBusinessId = @"89746d57-c25f-4cec-9c63-34d7780b044b";


// Configurations
NSInteger const RealmMigrationSchemeVersion = 1;

NSUInteger SyncTime = 60 * 10;                             // 10 m

// Other constants
NSString *const kHTTPResponseDomain = @"HTTPResponseDomain";
NSString *const kErrorMessageNoConnection = @"Oh no. We can't connect to the internet right now. Please try again soon.";
NSString *const kErrorMessageNoServer = @"Please try later\nWe are unable to connect to the server";
NSString *const kErrorMessageUnknown = @"Oh no. We can't connect to the internet right now. Please try again soon.";

// NSUserDefaults keys
NSString *const kTokenExpired = @"tokenExpired";

// NSNotification names
NSString *const NotificationSyncData = @"NotificationSyncData";

NSString *const NotificationCancelSync = @"NotificationCancelSync";
NSString *const NotificationRefreshData = @"NotificationRefreshData";
NSString *const NotificationTokenExpired = @"NotificationTokenExpired";

// Sync data names
NSString *const SyncDataProduct = @"SyncDataProduct";

// Empty screen messages
NSString *const EmptyList = @"You're done for today!";

