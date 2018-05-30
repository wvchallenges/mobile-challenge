//
//  BaseRealmModel.m
//  Core
//
//  Created by Armen Mkrtchian on 17/11/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "BaseRealmModel.h"

@implementation BaseRealmModel

- (instancetype)initWithModel:(id)model {
    
    if (!model) {
        
        return nil;
    }
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithType:(NSString *)type value:(NSString *)value {
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)saveInDefaultRealm {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [self saveInRealm:realm];
}

- (void)saveInRealm:(RLMRealm *)realm {
    
    // Save your object
//    @weakify(realm);
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
    
        //Background Thread
//        @strongify(realm);
        [realm beginWriteTransaction];
        [realm addObject:self];
        [realm commitWriteTransaction];
//        dispatch_async(dispatch_get_main_queue(), ^(void){
//            //Run UI Updates
//        });
//    });
}

- (void)createOrUpdateInDefaultRealm {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [self createOrUpdateInRealm:realm];
}

- (void)createOrUpdateInRealm:(RLMRealm *)realm {
    // Save your object
//    @weakify(realm);
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//        Background Thread
//        @strongify(realm);
        [realm beginWriteTransaction];
        [[self class] createOrUpdateInDefaultRealmWithValue:self];
        [realm commitWriteTransaction];
//        dispatch_async(dispatch_get_main_queue(), ^(void){
//            //Run UI Updates
//        });
//    });
}



+ (void)removeAllObjects {
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background Thread
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *arrayOfObjects = [[self class] allObjects];
        [realm beginWriteTransaction];
        [realm deleteObjects:arrayOfObjects];
        [realm commitWriteTransaction];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
        });
//    });
}

- (RLMArray *)populateData:(RLMArray *)array className:(NSString *)className type:(NSString *)type {
    
    RLMArray *objectArray = [[RLMArray alloc] initWithObjectClassName:className];
    for (NSString *object in array) {
        
        if ([[NSClassFromString(className) class] instancesRespondToSelector:@selector(initWithType:value:)]) {
            
            id model = [[NSClassFromString(className) alloc] initWithType:type value:object];
            [objectArray addObject:model];
        }
    }
    
    return objectArray;
}

- (RLMArray *)populateData:(RLMArray *)array className:(NSString *)className {
    
    RLMArray *objectArray = [[RLMArray alloc] initWithObjectClassName:className];
    for (id object in array) {
        
        if ([[NSClassFromString(className) class] instancesRespondToSelector:@selector(initWithModel:)]) {
            
            id model = [[NSClassFromString(className) alloc] initWithModel:object];
            [objectArray addObject:model];
        }
    }
    
    return objectArray;
}
@end
