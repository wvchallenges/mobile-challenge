//
//  ServiceFactory.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "ServiceFactory.h"
#import "ConfigurationManager.h"
#import "BuildersFactory.h"
#import "ProductFetcherService.h"
#import "ProductFetcherServiceImpl.h"
#import "HttpOperationsManager.h"

@interface ServiceFactory()

@property (nonatomic, strong) id<ProductFetcherService> productFetcherService;

@end

@implementation ServiceFactory

- (id<ProductFetcherService>) createProductFetcherService
{
    if (!self.productFetcherService)
    {
        self.productFetcherService = [[ProductFetcherServiceImpl alloc] init];
        
        self.productFetcherService.configurationManager = self.configurationManager;
        self.productFetcherService.productBuilder = [self.buildersFactory createProductBuilder];
        self.productFetcherService.httpOperationsFactory = self.httpOperationsFactory;
    }
    
    return self.productFetcherService;
}

@end
