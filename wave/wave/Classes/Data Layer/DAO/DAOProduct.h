//
//  DAOProduct.h
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseDAO.h"

@interface DAOProduct : BaseDAO

#pragma mark - COMMUNICATION WITH SERVER
/**
 * Get Product with productId
 *
 */
- (void)getProduct:(NSString *)productId
      completionBlock:(CompletionBlock)completionBlock;

#pragma mark - REALM LOCAL STORAGE
#pragma mark - SETTERS
/**
 * No setters
 *
 */
#pragma mark - GETTERS
/**
 * Get Product
 *
 */
- (NSArray *)getProduct;
@end
