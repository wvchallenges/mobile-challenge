//
//  ServiceProduct.h
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseService.h"

@interface ServiceProduct : BaseService
/**
 * Get Product with productId
 *
 */
- (void)getProducts:(NSString *)productId
    completionBlock:(CompletionBlock)completionBlock;

/**
 * Get Products
 *
 */
- (NSArray *)getProducts;
@end
