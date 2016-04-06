//
//  ProductTableViewCell.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "ProductViewModel.h"
#import "ProductViewModelDelegate.h"

@interface ProductTableViewCell () <ProductViewModelDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *dollarsLabel;
@property (strong, nonatomic) IBOutlet UILabel *centsLabel;

@property (strong, nonatomic) ProductViewModel *viewModel;

@end

@implementation ProductTableViewCell

- (void) setupWithProduct:(Product *)product {
    if (self.viewModel == nil) {
        self.viewModel = [[ProductViewModel alloc] init];
        self.viewModel.modelViewDelegate = self;
    }
    [self.viewModel setCurrentProduct:product];
}

#pragma - mark
#pragma ViewModelDelegate

- (void) recieveProduct {
    self.titleLabel.text = self.viewModel.name;
    self.descriptionLabel.text = self.viewModel.productDescription;
    self.dollarsLabel.text = self.viewModel.dollarsString;
    self.centsLabel.text = self.viewModel.centsString;
}

@end
