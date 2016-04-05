//
//  ProductFetcherService.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product, ConfigurationManager, ProductBuilder, HttpOperationsManager;

typedef void (^ProductFetchSuccessBlock) (NSArray<Product *> *products);
typedef void (^ProductFetchFailureBlock) (NSError *error);

/**
 Definition of the service used to fetch the products from the server
 */
@protocol ProductFetcherService <NSObject>

@property (nonatomic, weak) ConfigurationManager *configurationManager;
@property (nonatomic, weak) ProductBuilder *productBuilder;
@property (nonatomic, weak) HttpOperationsManager *httpOperationsFactory;

-(void)fetchProducts:(ProductFetchSuccessBlock) success failure:(ProductFetchFailureBlock) failure;

@end
