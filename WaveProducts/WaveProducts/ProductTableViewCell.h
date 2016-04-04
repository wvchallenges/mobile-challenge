//
//  ProductTableViewCell.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface ProductTableViewCell : UITableViewCell

- (void) setupWithProduct:(Product *)product;

@end
