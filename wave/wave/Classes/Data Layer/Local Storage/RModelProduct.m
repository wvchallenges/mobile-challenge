//
//  RModelProduct.m
//  Core
//
//  Created by Armen on 7/20/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "RModelProduct.h"

#import "ModelProduct.h"

@implementation RModelProduct
+ (NSString *)primaryKey {
    
    return @"_id";
}

- (instancetype)initWithModel:(ModelProduct *)model {
    
    self = [super initWithModel:model];
    if (self) {
        
        self._id = model._id;
        self.url = model.url;
        self.name = model.name;
        self.price = model.price;
        self.active = model.active;
    }
    return self;
}
@end
