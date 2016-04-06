//
//  ProductViewModel.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProductViewModelDelegate.h"

@interface ProductViewModel : NSObject

@property (assign, readonly) NSInteger productId;
@property (strong, readonly) NSString *url;
@property (strong, readonly) NSString *name;
@property (strong, readonly) NSNumber *price;
@property (strong, readonly) NSString *dollarsString;
@property (strong, readonly) NSString *centsString;
@property (strong, readonly) NSString *productDescription;
@property (assign, readonly) BOOL isSold;
@property (assign, readonly) BOOL isBought;
@property (assign, readonly) BOOL active;
@property (strong, readonly) NSDate *dateCreated;
@property (strong, readonly) NSString *dateModified;
@property (strong, readonly) UIColor *isBoughtColor;

@property (strong, nonatomic) id <ProductViewModelDelegate> modelViewDelegate;

// Public Methods
- (instancetype) initWithProduct:(Product *)product;
- (void) setCurrentProduct:(Product *)product;

@end
