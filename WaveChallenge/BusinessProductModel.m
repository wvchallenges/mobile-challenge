//
//  BusinessProductModel.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/19/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "BusinessProductModel.h"

@interface BusinessProductModel()

@property (strong,nonatomic,readwrite) NSNumber* id;
@property (strong,nonatomic,readwrite) NSURL* url;
@property (strong,nonatomic,readwrite) NSString* productName;
@property (strong,nonatomic,readwrite) NSString* productDescription;
@property (strong,nonatomic,readwrite) NSDecimalNumber* price;
@property (nonatomic,readwrite) BOOL isSold;
@property (nonatomic,readwrite) BOOL isBought;
@property (strong,nonatomic,readwrite) AccountModel* incomeAccount;
@property (strong,nonatomic,readwrite) AccountModel* expenseAccount;
@property (nonatomic,readwrite) BOOL active;
@property (strong,nonatomic,readwrite) NSDate* createDate;
@property (strong,nonatomic,readwrite) NSDate* modifiedDate;

@end

@implementation BusinessProductModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"id":@"id",
             @"url":@"url",
             @"productName":@"name",
             @"price":@"price",
             @"productDescription":@"description",
             @"isSold":@"is_sold",
             @"isBought":@"is_bought",
             @"incomeAccount":@"income_account",
             @"expenseAccount":@"expense_account",
             @"active":@"active",
             @"createDate":@"date_created",
             @"modifiedDate":@"date_modified"
             };
}

+ (NSDate *)utcStringToDateFromString:(NSString*) utcString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZ";
    NSDate* date = [dateFormatter dateFromString:utcString];
    return date;
}

+(NSValueTransformer*) priceJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSDecimalNumber* decimal = [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
        return decimal;
    }];
}

+(NSValueTransformer*) createDateJSONTransformer {
    return [MTLValueTransformer
            transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                NSDate* date = [self utcStringToDateFromString:value];
                return date;
    }];
}

+(NSValueTransformer*) modifiedDateJSONTransformer {
    return [MTLValueTransformer
            transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                NSDate* date = [self utcStringToDateFromString:value];
                return date;
    }];
}

+(NSValueTransformer*) isSoldJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
    
}

+(NSValueTransformer*) isBoughtJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+(NSValueTransformer*) incomeAccountJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[AccountModel class]];
}

+(NSValueTransformer*) expenseAccountJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[AccountModel class]];
}

+(NSValueTransformer*) activeJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
    
}

+(NSValueTransformer*) urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
    
}




@end
