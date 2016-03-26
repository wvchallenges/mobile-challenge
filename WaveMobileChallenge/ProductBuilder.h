//
//  ProductBuilder.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;

/**
 Used to build an instance of Product from json
 */
@interface ProductBuilder : NSObject

/**
 Used to build an instance of Product from json
 
 @param json NSDictionary that represents the product data
 
 @returns Instance of Product
 */
- (Product *) buildProduct: (NSDictionary *) json;

@end
