//
//  ProductsNetworkManager.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsNetworkManager.h"
#import <AFNetworking/AFURLSessionManager.h>

@implementation ProductsNetworkManager

+ (ProductsNetworkManager *) sharedManager {
    static ProductsNetworkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void) getProductsWithCompletion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"https://example.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // do whatever you'd like here; for example, if you want to convert
        // it to a string and log it, you might do something like:
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
