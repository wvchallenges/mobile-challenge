//
//  ViewControllerFactory.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "ViewControllerFactory.h"
#import "MainViewController.h"

@implementation ViewControllerFactory

- (MainViewController *) createMainViewController
{
    NSAssert(self.productFetcherService != nil, @"self.productFetcherService must be initialized!");
    
    MainViewController *mainViewController = [[MainViewController alloc] initWithNibName: @"MainViewController" bundle: nil];
    
    mainViewController.productFetcherService = self.productFetcherService;
    
    return mainViewController;
}

@end
