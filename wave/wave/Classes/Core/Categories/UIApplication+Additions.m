//
//  UIApplication+Additions.m
//  Core
//
//  Created by Armen Mkrtchyan on 11/26/15.
//  Copyright © 2015 Armen Mkrtchian. All rights reserved.
//

#import "UIApplication+Additions.h"

@implementation UIApplication (Additions)
+ (AppDelegate *)appDelegate {
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end
