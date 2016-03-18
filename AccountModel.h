//
//  IncomeAccountModel.h
//  
//
//  Created by Michael Chung on 3/15/16.
//
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
@interface AccountModel :MTLModel <MTLJSONSerializing>
@property (strong,nonatomic) NSString* id;
@property (strong,nonatomic) NSString* url;
@end
