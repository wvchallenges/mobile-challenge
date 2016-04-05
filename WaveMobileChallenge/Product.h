//
//  Product.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, assign)   int         identifier;
@property (nonatomic, copy)     NSString*   name;
@property (nonatomic, assign)   float       price;

@end
