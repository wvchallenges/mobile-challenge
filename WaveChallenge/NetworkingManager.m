//
//  NetworkingManager.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "NetworkingManager.h"
#import <AFNetworking.h>
#import <Mantle.h>
#import "BusinessProductModel.h"
@interface NetworkingManager()
@property (strong,nonatomic) AFHTTPSessionManager* manager;
@end
@implementation NetworkingManager

+ (instancetype)sharedInstance
{
    static NetworkingManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkingManager alloc] init];
    });
    return sharedInstance;
}

-(instancetype) init {
    if(!(self=[super init])) {return nil;}
    NSURL* baseUrl = [[NSURL alloc] initWithString:@"https://api.waveapps.com"];
    self.manager = [[AFHTTPSessionManager manager] initWithBaseURL:baseUrl];
    [[self.manager requestSerializer] setValue:@"Bearer d1hQ2z5dedmPGq8wVqU3vFLP4OstFh" forHTTPHeaderField:@"Authorization"];
    return self;
}
//89746d57-c25f-4cec-9c63-34d7780b044b
-(PMKPromise*) retrieveProductsFromBusinessId:(NSString*) businessId {
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        __block NSError* error;
        NSString* url = [NSString stringWithFormat:@"/businesses/%@/products/",businessId];
        
        [self.manager GET:url parameters:nil progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSArray* businessProducts = [MTLJSONAdapter modelsOfClass:[BusinessProductModel class] fromJSONArray:responseObject error:&error];
                 
                 // return error if no business products
                 resolve(error?:businessProducts);
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 resolve(error);
             }];
    }];
}

@end
