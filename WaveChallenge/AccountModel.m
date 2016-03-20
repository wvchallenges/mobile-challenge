//
//  AccountModel.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/19/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"id":@"id",
             @"url":@"url",
             };
}

+(NSValueTransformer*) urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
