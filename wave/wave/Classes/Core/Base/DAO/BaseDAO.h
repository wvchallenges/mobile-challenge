//
//  BaseDAO.h
//  Core
//
//  Created by Armen Mkrtchian on 4/20/15.
//  Copyright (c) 2015 Armen Mkrtchian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ErrorDataModel.h"

typedef void (^CompletionBlock)(id data, ErrorDataModel *error);

@interface BaseDAO : NSObject
- (void)cancelAllRequests;
@end
