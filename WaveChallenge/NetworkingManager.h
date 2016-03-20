//
//  NetworkingManager.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PromiseKit.h>
@interface NetworkingManager : NSObject
+ (instancetype)sharedInstance;
-(PMKPromise*) retrieveProductsFromBusinessId:(NSString*) businessId;
@end
