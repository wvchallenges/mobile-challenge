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

@property (assign, readonly) NSInteger productId;
@property (strong, readonly) NSString *url;
@property (strong, readonly) NSString *name;
@property (strong, readonly) NSNumber *price;
@property (strong, readonly) NSString *productDescription;
@property (assign, readonly) BOOL isSold;
@property (assign, readonly) BOOL isBought;
@property (assign, readonly) BOOL active;
@property (strong, readonly) NSDate *dateCreated;
@property (strong, readonly) NSString *dateModified;

@end
