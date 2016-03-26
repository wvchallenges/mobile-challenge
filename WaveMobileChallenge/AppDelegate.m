//
//  AppDelegate.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "AppDelegate.h"
#import "ConfigurationManager.h"
#import "BuildersFactory.h"
#import "ServiceFactory.h"
#import "ViewControllerFactory.h"
#import "MainViewController.h"
#import "HttpOperationsManager.h"

@interface AppDelegate ()

@property (nonatomic, strong) ConfigurationManager *configurationManager;
@property (nonatomic, strong) BuildersFactory *buildersFactory;
@property (nonatomic, strong) ServiceFactory *serviceFactory;
@property (nonatomic, strong) ViewControllerFactory *viewControllerFactory;
@property (nonatomic, strong) HttpOperationsManager *httpOperationsFactory;

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation AppDelegate

#pragma mark Initialization

- (void) initializeConfigurationManager
{
    self.configurationManager = [[ConfigurationManager alloc] init];
}

- (void) initializeBuildersFactory
{
    self.buildersFactory = [[BuildersFactory alloc] init];
}

- (void) initializeHttpOperationsFactory
{
    self.httpOperationsFactory = [[HttpOperationsManager alloc] init];
}

- (void) initializeServiceFactory
{
    NSAssert(self.configurationManager != nil, @"self.configurationManager must be initialized!");
    NSAssert(self.buildersFactory != nil, @"self.buildersFactory must be initialized!");
    NSAssert(self.httpOperationsFactory != nil, @"httpOperationsFactory must be initialized!");
    
    self.serviceFactory = [[ServiceFactory alloc] init];
    self.serviceFactory.buildersFactory = self.buildersFactory;
    self.serviceFactory.configurationManager = self.configurationManager;
    self.serviceFactory.httpOperationsFactory = self.httpOperationsFactory;
}

- (void) initializeViewControllerFactory
{
    NSAssert(self.serviceFactory != nil, @"self.serviceFactory must be initialized!");
    
    self.viewControllerFactory = [[ViewControllerFactory alloc] init];
    self.viewControllerFactory.productFetcherService = [self.serviceFactory createProductFetcherService];
}


#pragma mark App lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Be sure to run these initialize methods in order of dependencies
    [self initializeConfigurationManager];
    [self initializeBuildersFactory];
    [self initializeHttpOperationsFactory];
    [self initializeServiceFactory];
    [self initializeViewControllerFactory];
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    if (!self.navigationController)
    {
        self.navigationController = [[UINavigationController alloc] init];
        self.window.rootViewController = self.navigationController;
        
        [self.navigationController pushViewController: [self.viewControllerFactory createMainViewController] animated: YES];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
