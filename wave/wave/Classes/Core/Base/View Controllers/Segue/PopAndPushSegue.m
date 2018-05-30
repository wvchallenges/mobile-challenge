//
//  PopAndPushSegue.m
//  Core
//
//  Created by Armen Mkrtchyan on 4/22/16.
//  Copyright © 2016 Armen Mkrtchian. All rights reserved.
//

#import "PopAndPushSegue.h"

@implementation PopAndPushSegue

- (void)perform{
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    UINavigationController *navigationController = sourceViewController.navigationController;
    // Pop to root view controller (not animated) before pushing
    [navigationController popToRootViewControllerAnimated:NO];
    [navigationController pushViewController:destinationController animated:YES];
}
@end
