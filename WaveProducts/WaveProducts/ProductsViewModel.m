//
//  ProductsViewModel.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsViewModel.h"
#import "ProductsNetworkManager.h"

@implementation ProductsViewModel

- (instancetype) init {
    if (self = [super init]) {
        [self getProducts];
    }
    return self;
}

- (void) getProducts {
    __weak ProductsViewModel *wself = self;
    [[ProductsNetworkManager sharedManager] getProductsWithCompletion:^(BOOL success, NSArray *products, NSError *error) {
        __strong ProductsViewModel *sself = wself;
        if (success) {
            [sself.modelViewDelegate recieveProducts:products];
        } else {
            [sself.modelViewDelegate errorRecieved:error withMessage:@"There was an error getting the products. Please try again later."];
        }
    }];
}

@end
