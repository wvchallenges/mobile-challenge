//
//  BaseService.h
//  Core
//
//  Created by Armen Mkrtchian on 4/20/15.
//  Copyright (c) 2015 Armen Mkrtchian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject

typedef void (^CompletionBlock)(id data, ErrorDataModel *error);

- (void)constructFailureBlockWithBlock:(CompletionBlock)completionBlock;
//- (void)constructFailureBlockWithBlock:(CompletionBlock)completionBlock;

- (void)cancelAllRequests;
@end
