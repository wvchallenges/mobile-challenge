//
//  OpenAnimationView.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "OpenAnimationView.h"
#import "RectLayer.h"

#import <pop/POP.h>

@interface OpenAnimationView () <AnimationLayerDelegate>

@property (strong, nonatomic) RectLayer *circle;
@property (strong, nonatomic) NSTimer *animationTimer;

@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation OpenAnimationView

- (instancetype) initWithFrame:(CGRect)frame bgColor:(UIColor *)color
                     andParent:(UIView *)parent {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:color];
        [parent addSubview:self];
    }
    return self;
}

- (void) startAnimation {
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runAnimation) userInfo:nil repeats:NO];
}

- (void) runAnimation {
    if (self.circle == nil) {
        self.circle = [[RectLayer alloc] init];
        self.circle.parentViewDelegate = self;
    }
    [self.layer addSublayer: self.circle];
    [self.circle expand];
    [self addText];
}

- (void) addText {
    self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self.textLabel setText:@"W"];
    [self.textLabel setTextColor:[UIColor whiteColor]];
    [self.textLabel setTextAlignment:NSTextAlignmentCenter];
    [self.textLabel setFont:[self.textLabel.font fontWithSize:36]];
    [self addSubview:self.textLabel];
}

- (void) animationComplete {
    POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
    sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
    sprintAnimation.springBounciness = 20.f;
    [self.textLabel pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
    
    [UIView animateWithDuration:0.3 delay:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
    
}

@end
