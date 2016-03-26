//
//  ViewControllerFactory.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductFetcherService;
@class MainViewController;

/**
 The View Controller Factory does all these tedious initializing work for each service once and once only in the life-cycle of the app.
 It sets all the instance properties a view controller need during initialization.
 */
@interface ViewControllerFactory : NSObject

@property (nonatomic, weak) id<ProductFetcherService> productFetcherService;

/**
 Creates a fully configured instance of MainViewController
 
 @returns fully configured instance of MainViewController
 */
- (MainViewController *) createMainViewController;

@end
