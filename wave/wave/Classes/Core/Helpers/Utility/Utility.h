//
//  Utility.h
//  Core
//
//  Created by Armen on 1/18/16.
//  Copyright © 2016 Armen Mkrtchian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@interface Utility : NSObject

+ (NSString *)getFormattedCurrency:(NSInteger)value;

+ (BOOL)isInternetConnection;

+ (BOOL)reachable;
@end
