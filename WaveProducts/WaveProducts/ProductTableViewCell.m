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

#import <pop/POP.h>

@interface ProductTableViewCell () <ProductViewModelDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *dollarsLabel;
@property (strong, nonatomic) IBOutlet UILabel *centsLabel;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIView *isSoldView;

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

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
        [self.containerView pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
    } else {
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        sprintAnimation.springBounciness = 20.f;
        [self.containerView pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
    }
}

#pragma - mark
#pragma ViewModelDelegate

- (void) recieveProduct {
    self.titleLabel.text = self.viewModel.name;
    self.descriptionLabel.text = self.viewModel.productDescription;
    self.dollarsLabel.text = self.viewModel.dollarsString;
    self.centsLabel.text = self.viewModel.centsString;
    [self.isSoldView setBackgroundColor:self.viewModel.isBoughtColor];
}

@end
