//
//  VMProductCell.m
//  Core
//
//  Created by armen on 5/18/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "VMProductCell.h"

#import "ModelProduct.h"

#import "Utility.h"

@implementation VMProductCell

- (instancetype)initWithModel:(ModelProduct *)model {
    
    self = [super initWithModel:model];
    if (self) {
        
        self._id = model._id;
        self.name = model.name;
        self.price = [self formatPrice:model.price];
        
        self.letter = [[model.name substringToIndex:1] uppercaseString];
        self.color = UIColorFromRGB([self generateColor:model.name]);
    }
    
    return self;
}
                     
- (NSString *)formatPrice:(NSInteger)price {
    
    NSString *formattedString = [Utility getFormattedCurrency:price];
    return [NSString stringWithFormat:@"$%@", formattedString];
}

- (NSInteger)generateColor:(NSString *)text {
    
    NSInteger colors[] = {
        0xc789e1,
        0xffae51,
        0x7dcc52,
        0x66aee4,
        0xf3786a,
        0xf4d447
    };
    
    int hashCode = [self hashCode:text];
    
    return colors[abs(hashCode) % 6];
}

- (int)hashCode:(NSString *)text {
    
    int hash = 5381;
    for (int i = 0; i < text.length; i++) {
        
        unichar character = [text characterAtIndex:i];
        hash = ((hash << 5) + hash) + character; /* hash * 33 + c */
    }
    
    return hash;
}
@end
