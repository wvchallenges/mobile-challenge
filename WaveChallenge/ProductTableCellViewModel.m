//
//  ProductTableCellViewModel.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "ProductTableCellViewModel.h"
@interface ProductTableCellViewModel()
@property (strong,nonatomic,readwrite) NSString* productName;
@property (strong,nonatomic,readwrite) NSDecimalNumber* productPrice;
@end
@implementation ProductTableCellViewModel

-(instancetype) initWithProductName:(NSString*) productName
                    andProductPrice:(NSDecimalNumber*) productPrice {
    if(!(self=[super init])) {return nil;}
        self.productName = productName;
        self.productPrice = productPrice;
    return self;
}

@end
