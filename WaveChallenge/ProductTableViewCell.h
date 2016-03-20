//
//  ProductTableViewCell.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductTableCellViewModel.h"
@interface ProductTableViewCell : UITableViewCell

@property (strong,nonatomic) ProductTableCellViewModel* vm;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;

@end
