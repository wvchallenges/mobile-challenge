//
//  BaseLabel.m
//  Core
//
//  Created by Armen Mkrtchian on 10/15/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "BaseLabel.h"

@interface BaseLabel ()
@property CGFloat topInset;
@property CGFloat bottomInset;
@property CGFloat leftInset;
@property CGFloat rightInset;
@end

@implementation BaseLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    
    CGSize intrinsicSuperViewContentSize = [super intrinsicContentSize] ;
    intrinsicSuperViewContentSize.height += self.topInset + self.bottomInset ;
    intrinsicSuperViewContentSize.width += self.leftInset + self.rightInset ;
    return intrinsicSuperViewContentSize ;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)edgeInsets {
    
    self.topInset = edgeInsets.top;
    self.leftInset = edgeInsets.left;
    self.rightInset = edgeInsets.right;
    self.bottomInset = edgeInsets.bottom;
    [self invalidateIntrinsicContentSize] ;
}


@end
