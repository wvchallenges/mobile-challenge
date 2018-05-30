//
//  BaseViewModel.m
//  Core
//
//  Created by Armen Mkrtchian on 11/14/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (instancetype)initWithModel:(id)model {
    
    if (model == nil) {
        
        return nil;
    }
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}
@end
