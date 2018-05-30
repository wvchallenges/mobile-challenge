//
//  ButtonApplication.m
//  Core
//
//  Created by Armen on 11/24/15.
//  Copyright © 2015 Armen Mkrtchian. All rights reserved.
//

#import "ButtonApplication.h"

@interface ButtonApplication ()

@property (strong, nonatomic) UIColor *normalColor;

@end

@implementation ButtonApplication

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.layer.cornerRadius = 22;
//    self.normalColor = self.backgroundColor;
    
//    [self addTarget:self action:@selector(buttonHighlight) forControlEvents:UIControlEventTouchDown];
//    [self addTarget:self action:@selector(buttonNormal) forControlEvents:UIControlEventTouchUpInside];
//    [self addTarget:self action:@selector(buttonNormal) forControlEvents:UIControlEventTouchDragExit];
}

- (void)buttonHighlight {
    
    self.backgroundColor = UIColorFromRGB(0x27c7d8);
}

- (void)buttonNormal {
 
    self.backgroundColor = self.normalColor;
}

@end
