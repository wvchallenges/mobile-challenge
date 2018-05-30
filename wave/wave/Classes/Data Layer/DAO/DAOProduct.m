//
//  DAOProduct.m
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "DAOProduct.h"

//network
#import "NetworkProduct.h"

//model
#import "ModelProduct.h"

//local storage
#import "RModelProduct.h"

@import Realm;

@interface DAOProduct ()

@property (strong, nonatomic) NetworkProduct *networkProduct;

@end

@implementation DAOProduct

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _networkProduct = [[NetworkProduct alloc] init];
    }
    return self;
}

#pragma mark - COMMUNICATION WITH SERVER
/**
 * Get Product
 *
 */
- (void)getProduct:(NSString *)productId
      completionBlock:(CompletionBlock)completionBlock {
    
    [self.networkProduct getProduct:productId
                        completionBlock:^(NSArray *data, ErrorDataModel *error) {
                            
                            if(!error) {
                                
                                if ([data isKindOfClass:[NSArray class]]) {
                                    
                                    NSMutableArray <ModelProduct *>*productArray = [@[] mutableCopy];
                                    for (NSDictionary *item in data) {
                                        
                                        ModelProduct *model = [[ModelProduct alloc] initWithDictionary:item];
                                        [productArray addObject:model];
                                    }
                                    [self saveProduct:productArray];
                                    
                                    completionBlock(nil, nil);
                                    return;
                                }
                            }
                            completionBlock(data, error);
                        }];
}

#pragma mark - REALM LOCAL STORAGE
#pragma mark - Setters
/**
 * No setters
 *
 */

#pragma mark - GETTERS
/**
 * Get Product
 *
 */
- (NSArray *)getProduct {
    
    // Query using an NSPredicate
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    RLMResults *results = [RModelProduct allObjectsInRealm:realm];
    
    NSMutableArray *tempArray = [@[] mutableCopy];
    for (RModelProduct *realmModel in results) {
        
        ModelProduct *product = [[ModelProduct alloc] initWithModel:realmModel];
        
        if (product) {
            
            [tempArray addObject:product];
        }
    }
    
    return tempArray;
}


#pragma mark - PRIVATE METHODS
/**
 * Get collaborator by id
 *
 */
- (RModelProduct *)getProductById:(NSString *)productId {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RModelProduct *realmModel = [RModelProduct objectInRealm:realm forPrimaryKey:productId];
    
    return realmModel;
}

- (void)saveProduct:(NSArray *)arrayProduct {
    
    NSLog(@"saving products started in background thread");
    // Save your object
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        [realm beginWriteTransaction];
        for (ModelProduct *model in arrayProduct) {
            
            RModelProduct *realmModel = [[RModelProduct alloc] initWithModel:model];
            [RModelProduct createOrUpdateInRealm:realm withValue:realmModel];
        }
        [realm commitWriteTransaction];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            
            //Run UI Updates
            NSLog(@"saving products finished, update ui");
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationRefreshData object:SyncDataProduct];
        });
    });
}

- (void)cancelAllRequests {
    
    [self.networkProduct cancelAllRequests];
}

- (void)dealloc {
    
    [self cancelAllRequests];
}
@end
