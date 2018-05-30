//
//  RModelProduct.h
//  Core
//
//  Created by Armen on 7/20/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "AutoDefaultsRMLObject.h"

@interface RModelProduct : AutoDefaultsRMLObject
@property (nonatomic) NSInteger _id;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger price;
@property (nonatomic) BOOL active;
@end
