//
//  BusinessProductModel.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/19/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"
#import "Mantle.h"
@interface BusinessProductModel : MTLModel <MTLJSONSerializing>

@property (strong,nonatomic,readonly) NSNumber* id;
@property (strong,nonatomic,readonly) NSURL* url;
@property (strong,nonatomic,readonly) NSString* productName;
@property (strong,nonatomic,readonly) NSString* productDescription;
@property (strong,nonatomic,readonly) NSDecimalNumber* price;
@property (nonatomic,readonly) BOOL isSold;
@property (nonatomic,readonly) BOOL isBought;
@property (strong,nonatomic,readonly) AccountModel* incomeAccount;
@property (strong,nonatomic,readonly) AccountModel* expenseAccount;
@property (nonatomic,readonly) BOOL active;
@property (strong,nonatomic,readonly) NSDate* createDate;
@property (strong,nonatomic,readonly) NSDate* modifiedDate;

@end
