//
//  NetworkProduct.m
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "NetworkProduct.h"

static NSString *const kURLGetProduct = @"/businesses/%@/products/?access_token=%@";

@implementation NetworkProduct
- (void)getProduct:(NSString *)productId completionBlock:(CompletionBlock)completionBlock {
    
    AFSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"GetProduct JSON: %@", responseObject);
        if (completionBlock) {
            
            completionBlock(responseObject , nil);
            return;
        }
    };
    
    NSString *url = [NSString stringWithFormat:kURLGetProduct, productId, WaveAccessToken];
    [self makeGetRequest:url
              withParams:nil
                 success:[self constructSuccessBlockWithBlock:successBlock]
                 failure:[self constructFailureBlockWithBlock:completionBlock]];
}
@end
