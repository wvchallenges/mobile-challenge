//
//  ProductBuilder.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "ProductBuilder.h"
#import "Product.h"

NSString * const kIDKey = @"id";
NSString * const kNameKey = @"name";
NSString * const kPriceKey = @"price";

@implementation ProductBuilder

- (Product *) buildProduct: (NSDictionary *) json
{
    Product *product = [[Product alloc] init];
    
    if (!json)
    {
        return product;
    }
    
    product.identifier = [json[kIDKey] integerValue];
    product.name = json[kNameKey];
    product.price = [json[kPriceKey] floatValue];
    
    return product;
}

@end
