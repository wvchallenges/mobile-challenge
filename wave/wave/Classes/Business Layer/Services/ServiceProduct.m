//
//  ServiceProduct.m
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "ServiceProduct.h"

// dao
#import "DAOProduct.h"

// model
#import "ModelProduct.h"

// view model
#import "VMProductCell.h"

@interface ServiceProduct ()
@property (strong, nonatomic) DAOProduct *daoProduct;

@end

@implementation ServiceProduct

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _daoProduct = [DAOProduct new];
    }
    return self;
}

- (void)getProducts:(NSString *)productId
    completionBlock:(CompletionBlock)completionBlock {
    
    [self.daoProduct getProduct:productId
                completionBlock:^(NSArray *data, ErrorDataModel *error) {
                    
                    completionBlock(data, error);
                }];
}

- (NSArray *)getProducts {
    
    NSMutableArray *arrayProduct = [@[] mutableCopy];
    
    // Product
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[nameDescriptor];
    NSArray *sortedArray = [[self.daoProduct getProduct] sortedArrayUsingDescriptors:sortDescriptors];
    for (ModelProduct *product in sortedArray) {
        
        VMProductCell *vmProductCell = [[VMProductCell alloc] initWithModel:product];
        if (vmProductCell) {
            
            [arrayProduct addObject:vmProductCell];
        }
    }
    
    return arrayProduct;
}

- (void)cancelAllRequests {
    
    [self.daoProduct cancelAllRequests];
}
@end
