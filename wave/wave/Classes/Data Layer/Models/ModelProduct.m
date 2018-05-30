//
//  ModelProduct.m
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "ModelProduct.h"

#import "RModelProduct.h"

@implementation ModelProduct
- (instancetype)initWithModel:(RModelProduct *)model {
    
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

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"_id": @"id",
                                                                  }];
}
@end
