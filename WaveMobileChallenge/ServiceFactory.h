//
//  ServiceFactory.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConfigurationManager, BuildersFactory, HttpOperationsManager;
@protocol ProductFetcherService;

/**
 The Services Factory does all these tedious initializing work for each service once and once only in the life-cycle of the app.
 */
@interface ServiceFactory : NSObject

@property (nonatomic, weak) ConfigurationManager *configurationManager;
@property (nonatomic, weak) BuildersFactory *buildersFactory;
@property (nonatomic, weak) HttpOperationsManager *httpOperationsFactory;

/**
 Creates a fully configured instance of ProductFetcherService
 
 @returns fully configured instance of ProductFetcherService
 */
- (id<ProductFetcherService>) createProductFetcherService;

@end
