//
//  HttpOperationsFactory.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-25.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpSuccessBlock)(id responseData);
typedef void (^HttpFailureBlock)(NSError *error, id responseData);

/**
 The Http Operations Manager manager and perform all http requests
 */
@interface HttpOperationsManager : NSObject

/**
 Used to perform a HTTP GET request
 */
- (void) performGetRequestWithUrl: (NSString *) url
                          headers: (NSDictionary *) headers
                     successBlock: (HttpSuccessBlock) successBlock
                     failureBlock: (HttpFailureBlock) failureBlock;

@end
