//
//  ProductsNetworkManager.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsNetworkManager.h"
#import "Common.h"
#import <AFNetworking/AFNetworking.h>

@interface ProductsNetworkManager ()

@property (strong, nonatomic) AFHTTPSessionManager* manager;

@end

@implementation ProductsNetworkManager

+ (ProductsNetworkManager *) sharedManager {
    static ProductsNetworkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype) init {
    if (self = [super init]) {
        [self setupRequestBase];
    }
    return self;
}

- (void) setupRequestBase {
    NSURL *url = [NSURL URLWithString:BASE_URL];
    self.manager = [[AFHTTPSessionManager manager] initWithBaseURL:url];
    [[self.manager requestSerializer] setValue:[NSString stringWithFormat:@"Bearer %@", ACCESS_TOKEN] forHTTPHeaderField:@"Authorization"];
}

- (void) getProductsWithCompletion {
    
    NSString* url = [NSString stringWithFormat:@"/businesses/%@/products/", BUSINESS_ID];
    [self.manager GET:url parameters:nil progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSLog(@"%@", responseObject);
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"Failure");
      }];
}

@end
