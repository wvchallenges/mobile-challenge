//
//  ProductsNetworkManager.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^productsCompletion)(BOOL success, NSArray *products, NSError *error);

@interface ProductsNetworkManager : NSObject

+ (ProductsNetworkManager *) sharedManager;

- (void) getProductsWithCompletion:(productsCompletion)completeBlock;

@end
