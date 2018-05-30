//
//  BaseDataModel.m
//  Core
//
//  Created by Armen on 4/7/14.
//  Copyright (c) 2014 Armen Mkrtchian All rights reserved.
//

#import "BaseDataModel.h"

@implementation BaseDataModel

- (instancetype)initWithDictionary:(NSDictionary*)dict {
    
    NSError *error;
    self = [super initWithDictionary:dict error:&error];
    if (error) {
        
        NSLog(@"Jsonmodel error: %@", [error description]);
    }
    
    if (self) {
        
//        _rowid = nilOrJSONObjectForKey(dict, kRowId);
    }
    
    return self;
}

- (instancetype)initWithModel:(id)realmModel {
    
    if (realmModel == nil) {
        
        return nil;
    }
    
    self = [super init];
    
    return self;
}

+ (BOOL)propertyIsOptional:(NSString*)propertyName {
    
    return YES;
}

- (NSArray *)populateData:(NSArray *)array className:(NSString *)className {
    
    NSMutableArray *objectArray = [NSMutableArray new];
    for (id object in array) {
        
        id model = [[NSClassFromString(className) alloc] initWithModel:object];
        [objectArray addObject:model];
    }
    
    return objectArray;
}
@end
