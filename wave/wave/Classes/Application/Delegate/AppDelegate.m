//
//  AppDelegate.m
//  wave
//
//  Created by Armen Mkrtchyan on 5/29/18.
//  Copyright © 2018 Armen Mkrtchyan. All rights reserved.
//

#import "AppDelegate.h"

#import "LoadingViewController.h"

@import UserNotifications;

@import Realm;

@interface AppDelegate ()
@property (nonatomic) BOOL activatedFromBackground;
@property (nonatomic) BOOL applicationInBackground;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    self.activatedFromBackground = NO;
    
    //Realm
    [self realmMigration];
    
    [self customizeAppearance];
    
    return YES;
}

#pragma mark - private methods
- (void)realmMigration {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    NSLog(@"Realm path %@", config.fileURL);
    
    // Set the new schema version. This must be greater than the previously used
    // version (if you've never set a schema version before, the version is 0).
    config.schemaVersion = RealmMigrationSchemeVersion;
    
    // Set the block which will be called automatically when opening a Realm with a
    // schema version lower than the one set above
    
    config.shouldCompactOnLaunch = ^BOOL(NSUInteger totalBytes, NSUInteger usedBytes){
        // totalBytes refers to the size of the file on disk in bytes (data + free space)
        // usedBytes refers to the number of bytes used by data in the file
        
        // Compact if the file is over 100MB in size and less than 50% 'used'
        NSUInteger oneHundredMB = 30 * 1024 * 1024;
        return (totalBytes > oneHundredMB) && (usedBytes / totalBytes) < 0.5;
    };
    
    // Tell Realm to use this new configuration object for the default Realm
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    NSError *error = nil;
    // Realm is compacted on the first open if the configuration block conditions were met.
    [RLMRealm realmWithConfiguration:config error:&error];
    if (error) {
        // handle error compacting or opening Realm
    }
    
}

#pragma mark - AppDelegate

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    self.applicationInBackground = YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    self.activatedFromBackground = YES;
    self.applicationInBackground = NO;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private Methods
- (void)customizeAppearance {
    
    //    self.navigationController.navigationBar.tintColor = UIColorFromRGB(0x00acc1);
    [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x0085FF)];
    
    [[UINavigationBar appearance] setTranslucent:NO];
}

#pragma mark - Public Methods
+ (AppDelegate *)sharedDelegate {
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)isApplicationInBackground {
    
    return self.applicationInBackground;
}

@end
