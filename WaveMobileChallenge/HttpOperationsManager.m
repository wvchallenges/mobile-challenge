//
//  HttpOperationsFactory.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "HttpOperationsManager.h"

NSString * const kGet = @"GET";

@interface HttpOperationsManager()

//Use NSURLSession to perform web calls
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation HttpOperationsManager

- (id) init
{
    if (self = [super init])
    {
        //Limit to just a single concurrent network operation
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        [configuration setHTTPMaximumConnectionsPerHost:1];
        
        self.session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void) performGetRequestWithUrl: (NSString *) url
                          headers: (NSDictionary *) headers
                     successBlock: (HttpSuccessBlock) successBlock
                     failureBlock: (HttpFailureBlock) failureBlock
{
    //Set up a NSMutableURLRequest for the GET Request with an 'Authorization' Header
    NSMutableURLRequest *getRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                          timeoutInterval:60.0];
    
    //Add the headers
    [headers enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop)
     {
         [getRequest addValue:obj forHTTPHeaderField:key];
     }];
    
    //Set the HTTP request type to GET
    [getRequest setHTTPMethod:kGet];
    
    //Execute the network call
    NSURLSessionDataTask *getTask = [self.session dataTaskWithRequest:getRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //Network call complete
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
        
        if (!error && httpResponse.statusCode == 200)
        {
            if (successBlock)
            {
                successBlock(data);
            }
        }
        else
        {
            if (failureBlock)
            {
                failureBlock(error, data);
            }
        }
        
    }];
    [getTask resume];
}

@end
