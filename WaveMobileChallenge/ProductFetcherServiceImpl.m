//
//  ProductFetcherServiceImpl.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "ProductFetcherServiceImpl.h"
#import "ConfigurationManager.h"
#import "ProductBuilder.h"
#import "Product.h"
#import "HttpOperationsManager.h"

NSString * const kFetchProductsURL = @"/businesses/{business_id}/products/";
NSString * const kBusinessIDToken = @"{business_id}";

@implementation ProductFetcherServiceImpl

@synthesize configurationManager, productBuilder, httpOperationsFactory;

-(void)fetchProducts:(ProductFetchSuccessBlock) success failure:(ProductFetchFailureBlock) failure
{
    NSAssert(self.configurationManager != nil, @"self.configurationManager must be initialized!");
    NSAssert(self.productBuilder != nil, @"productBuilder must be initialized!");
    
    //Produce the complete URL for fetching products by combining the base URL with "/businesses/{business_id}/products/" and replace {business_id} with the actual business ID
    NSString *completeURL = [NSString stringWithFormat:@"%@%@", self.configurationManager.apiServerBaseURL, kFetchProductsURL];
    completeURL = [completeURL stringByReplacingOccurrencesOfString:kBusinessIDToken withString:self.configurationManager.businessID];
    
    [self.httpOperationsFactory performGetRequestWithUrl:completeURL
                                                      headers:[NSDictionary dictionaryWithObjectsAndKeys:self.configurationManager.accessToken,@"Authorization", nil]
                                                 successBlock:^(id responseData) {
        
        //Do the parsing in a background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
            
            NSMutableArray<Product *> *productsArray = [[NSMutableArray alloc] init];
            
            DLog(@"Result JSON: %@", jsonArray);
            
            //Parse the JSON to produce the Products objects
            for (NSDictionary *productDictionary in jsonArray)
            {
                Product *product = [self.productBuilder buildProduct: productDictionary];
                
                [productsArray addObject:product];
            }
            
            //Run the callback back on main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success)
                {
                    success(productsArray);
                }
            });
        });
    } failureBlock:^(NSError *error, id responseData) {
        if (failure)
        {
            failure(error);
        }
    }];
}

@end
