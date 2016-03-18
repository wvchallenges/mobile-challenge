//
//  IncomeAccountModel.m
//  
//
//  Created by Michael Chung on 3/15/16.
//
//

#import "AccountModel.h"

@implementation AccountModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id":@"id",
             @"url":@"url"
             };
}

+(NSValueTransformer* ) idJSONTransformer {
    return [MTLValueTransformer
            transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                return [value stringValue];
            } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                NSNumber *id = [f numberFromString:value];
                return id;
            }];
}

@end
