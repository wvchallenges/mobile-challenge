//
//  ProductViewModel.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductViewModel.h"

@implementation ProductViewModel

- (instancetype) initWithProduct:(Product *)product {
    if (self = [super init]) {
        [self constructWithProduct:product];
    }
    return self;
}

- (void) setCurrentProduct:(Product *)product {
    [self constructWithProduct:product];
    [self.modelViewDelegate recieveProduct];
}

- (void) constructWithProduct:(Product *)product {
    _productId = product.productId;
    _url = product.url;
    _name = product.name;
    _price = product.price;
    _productDescription = product.productDescription;
    _isSold = product.isSold;
    _isBought = product.isBought;
    _active = product.active;
    _dateCreated = product.dateCreated;
    _dateModified = product.dateModified;
    
    // Convience formatting.
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:0];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    _dollarsString = [NSString stringWithFormat:@"$%@",
                      [formatter stringFromNumber:product.price]];
    float cents = (product.price.floatValue - floor(product.price.floatValue))*100;
    if (cents < 10) {
        _centsString = [NSString stringWithFormat:@"0%.f", cents];
    } else {
        _centsString = [NSString stringWithFormat:@"%.f", cents];
    }
}

@end
