//
//  ProductTableViewCell.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "Product.h"

@interface ProductTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *dollarsLabel;
@property (strong, nonatomic) IBOutlet UILabel *centsLabel;


@end

@implementation ProductTableViewCell

- (void) setupWithProduct:(Product *)product {
    self.titleLabel.text = product.name;
    self.descriptionLabel.text = product.productDescription;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:0];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    self.dollarsLabel.text = [NSString stringWithFormat:@"$%@", [formatter stringFromNumber:product.price]];
    float cents = (product.price.floatValue - floor(product.price.floatValue))*100;
    if (cents < 10) {
        self.centsLabel.text = [NSString stringWithFormat:@"0%.f", cents];
    } else {
        self.centsLabel.text = [NSString stringWithFormat:@"%.f", cents];
    }
}

@end
