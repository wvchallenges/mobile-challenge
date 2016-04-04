//
//  Product.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

/*
 @TODO
 1) Handle income account model.
 2) Handle default sales taxes.
 */
@interface Product : JSONModel

@property (assign, nonatomic) NSInteger productId;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *productDescription;
@property (assign, nonatomic) BOOL isSold;
@property (assign, nonatomic) BOOL isBought;
@property (assign, nonatomic) BOOL active;
@property (strong, nonatomic) NSDate *dateCreated;
@property (strong, nonatomic) NSString *dateModified;

@end
