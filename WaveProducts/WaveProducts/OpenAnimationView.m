//
//  OpenAnimationView.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "OpenAnimationView.h"
#import "RectLayer.h"

@interface OpenAnimationView () <AnimationLayerDelegate>

@property (strong, nonatomic) RectLayer *circle;
@property (strong, nonatomic) NSTimer *animationTimer;

@end

@implementation OpenAnimationView

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
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    [label setText:@"W"];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[label.font fontWithSize:36]];
    [self addSubview:label];
}

- (void) animationComplete {
    [self removeFromSuperview];
}

@end
