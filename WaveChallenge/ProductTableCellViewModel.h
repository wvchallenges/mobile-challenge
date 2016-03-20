//
//  ProductTableCellViewModel.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductTableCellViewModel : NSObject
@property (strong,nonatomic,readonly) NSString* productName;
@property (strong,nonatomic,readonly) NSDecimalNumber* productPrice;

-(instancetype) initWithProductName:(NSString*) productName
                    andProductPrice:(NSDecimalNumber*) productPrice;
@end
