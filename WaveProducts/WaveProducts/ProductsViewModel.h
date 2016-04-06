//
//  ProductsViewModel.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductsViewModelDelegate.h"

#import "Product.h"

@interface ProductsViewModel : NSObject

@property (strong, nonatomic) id<ProductsViewModelDelegate> modelViewDelegate;

@end
