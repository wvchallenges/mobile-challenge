//
//  BuildersFactory.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProductBuilder;

/**
 The purpose of using a Builders Factory is because some object will have another types of objects nested with in them. 
 The builder for the parent object will need to have all builders for its children objects as its properties. 
 The Builders Factory does all these tedious initializing work for each builder once and once only in the life-cycle of the app.
 */
@interface BuildersFactory : NSObject


/**
 Creates a fully configured ProductBuilder
 
 @returns fully configured ProductBuilder
 */
- (ProductBuilder *) createProductBuilder;

@end
