//
//  UIColor+Products.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "UIColor+Products.h"

@implementation UIColor (Products)

+ (UIColor *) isBoughtColor {
    return [UIColor colorWithRed:150/255.0 green:182/255.0 blue:206/255.0 alpha:1.0];
}

+ (UIColor *) isNotBoughtColor {
    return [UIColor colorWithRed:145/255.0 green:197/255.0 blue:180/255.0 alpha:1.0];
}

+ (UIColor *) primaryColor {
    return [UIColor colorWithRed:133/255.0 green:166/255.0 blue:195/255.0 alpha:1.0];
}


@end
