//
//  PushNoAnimationSegue.m
//  Core
//
//  Created by Armen Mkrtchian on 5/22/15.
//  Copyright (c) 2015 Armen Mkrtchian. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void)perform{
    UIViewController *vc = self.sourceViewController;
    [vc.navigationController pushViewController:self.destinationViewController animated:NO];
}

@end
