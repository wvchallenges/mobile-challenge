//
//  Utility.m
//  Core
//
//  Created by Armen on 1/18/16.
//  Copyright © 2016 Armen Mkrtchian. All rights reserved.
//

#import "Utility.h"

//Helpers
#import "Reachability.h"

@implementation Utility

+ (NSString *)getFormattedCurrency:(NSInteger)value {
    
    static NSNumberFormatter *formatter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle= NSNumberFormatterCurrencyStyle;
        formatter.maximumIntegerDigits=6;
        formatter.maximumFractionDigits=2;
        formatter.currencySymbol= @"$";
        formatter.currencyDecimalSeparator= @".";
        formatter.currencyGroupingSeparator= @",";
        formatter.positivePrefix=@"";
    });
    NSString *formattedString = [formatter stringFromNumber:@(value)];
    
    return formattedString;
}

+ (BOOL)isInternetConnection {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    return networkStatus != NotReachable;
}

+ (BOOL)reachable {
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    if ([reach currentReachabilityStatus] != NotReachable) {
        NSLog(@"Device is connected to the internet");
        return TRUE;
    }
    else {
        NSLog(@"Device is not connected to the internet");
        return FALSE;
    }
}
@end
