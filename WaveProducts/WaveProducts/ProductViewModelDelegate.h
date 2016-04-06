//
//  ProductViewModelDelegate.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol ProductViewModelDelegate <NSObject>

- (void) recieveProduct;

@end
