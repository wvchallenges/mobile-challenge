//
//  Product.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "Product.h"

@implementation Product

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"productId",
                                                       @"description": @"productDescription",
                                                       @"is_sold": @"isSold",
                                                       @"is_bought": @"isBought",
                                                       @"income_account": @"incomeAccount",
                                                       @"expense_account": @"expenseAccount",
                                                       @"default_sales_taxes": @"defaultSalesTaxes",
                                                       @"date_created": @"dateCreated",
                                                       @"date_modified": @"dateModified",
                                                    }];
}

@end
