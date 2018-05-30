//
//  VMProductCell.h
//  Core
//
//  Created by armen on 5/18/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseViewModel.h"

@class ModelProduct;

@interface VMProductCell : BaseViewModel
@property (nonatomic) NSInteger _id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *letter;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *cellIdentifier;
@end
