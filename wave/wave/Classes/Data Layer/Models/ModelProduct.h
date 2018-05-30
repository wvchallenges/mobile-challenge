//
//  ModelProduct.h
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseDataModel.h"

@interface ModelProduct : BaseDataModel
@property (nonatomic) NSInteger _id;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger price;
@property (nonatomic) BOOL active;
@end
