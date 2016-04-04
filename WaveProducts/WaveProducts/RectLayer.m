//
//  CircleLayer.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "RectLayer.h"
#import <UIKit/UIKit.h>

@implementation RectLayer

- (instancetype) init {
    if (self = [super init]) {
        self.fillColor = [UIColor redColor].CGColor;
        self.path = (__bridge CGPathRef _Nullable)([self rectPathSmall]);
    }
    return self;
}

- (void) expand {
    CABasicAnimation* expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];

    CFTimeInterval animationDuration = 0.3;
    expandAnimation.fromValue = (__bridge id _Nullable)([[self rectPathSmall] CGPath]);
    expandAnimation.toValue = (__bridge id _Nullable)([[self rectPathLarge] CGPath])
    ;
    expandAnimation.duration = animationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    
    CABasicAnimation *wobbleAnimation0 = [CABasicAnimation animationWithKeyPath:@"path"];
    wobbleAnimation0.fromValue = (__bridge id _Nullable)([[self rectPathLarge] CGPath]);
    wobbleAnimation0.toValue = (__bridge id _Nullable)([[self rectPathSquishHorizontal] CGPath]);
    wobbleAnimation0.beginTime = animationDuration;
    wobbleAnimation0.duration = animationDuration;
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = [NSArray arrayWithObjects:expandAnimation, wobbleAnimation0, nil];
    animationGroup.duration = wobbleAnimation0.beginTime + wobbleAnimation0.duration;
    animationGroup.repeatCount = 0;
    [self addAnimation:animationGroup forKey:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:(wobbleAnimation0.beginTime + wobbleAnimation0.duration) target:self selector:@selector(wobble) userInfo:nil repeats:NO];
}

- (void) finalStage {
    CABasicAnimation* expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    CFTimeInterval animationDuration = 0.3;
    expandAnimation.fromValue = (__bridge id _Nullable)([[self rectPathLarge] CGPath]);
    expandAnimation.toValue = (__bridge id _Nullable)([[self rectPathFinal] CGPath])
    ;
    expandAnimation.duration = animationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
    
    CFTimeInterval animationDelay = 0.5;
    [NSTimer scheduledTimerWithTimeInterval:(animationDuration+animationDelay) target:self selector:@selector(removeView) userInfo:nil repeats:NO];
}

- (void) removeView {
    [self.parentViewDelegate animationComplete];
}

- (UIBezierPath *) rectPathSmall {
    CGFloat size = 10;
    CGFloat xPos = [UIScreen mainScreen].bounds.size.width/2-size/2;
    CGFloat yPos = [UIScreen mainScreen].bounds.size.height/2-size/2;
    return [UIBezierPath bezierPathWithRect:CGRectMake(xPos, yPos, size, size)];
}

- (UIBezierPath *) rectPathLarge {
    CGFloat size = [UIScreen mainScreen].bounds.size.width/4;
    CGFloat xPos = [UIScreen mainScreen].bounds.size.width/2-size/2;
    CGFloat yPos = [UIScreen mainScreen].bounds.size.height/2-size/2;
    return [UIBezierPath bezierPathWithRect:CGRectMake(xPos, yPos, size, size)];
}

- (UIBezierPath *) rectPathSquishVertical {
    CGFloat size = [UIScreen mainScreen].bounds.size.width/4;
    CGFloat xPos = [UIScreen mainScreen].bounds.size.width/2-size/2;
    CGFloat yPos = [UIScreen mainScreen].bounds.size.height/2-size/2;
    return [UIBezierPath bezierPathWithRect:CGRectMake(xPos, yPos+size/12, size, size-size/6)];
}

- (UIBezierPath *) rectPathSquishHorizontal {
    CGFloat size = [UIScreen mainScreen].bounds.size.width/4;
    CGFloat xPos = [UIScreen mainScreen].bounds.size.width/2-size/2;
    CGFloat yPos = [UIScreen mainScreen].bounds.size.height/2-size/2;
    return [UIBezierPath bezierPathWithRect:CGRectMake(xPos+size/12, yPos, size-size/6, size)];
}

- (void) wobble {
    CFTimeInterval animationDuration = 0.8;
    
    // 1
    CABasicAnimation *wobbleAnimation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    wobbleAnimation1.fromValue = (__bridge id _Nullable)([[self rectPathSquishHorizontal] CGPath]);
    wobbleAnimation1.toValue = (__bridge id _Nullable)([[self rectPathSquishVertical] CGPath]);
    wobbleAnimation1.beginTime = 0.0;
    wobbleAnimation1.duration = animationDuration;
    
    // 2
    CABasicAnimation *wobbleAnimation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    wobbleAnimation2.fromValue = (__bridge id _Nullable)([[self rectPathSquishVertical] CGPath]);
    wobbleAnimation2.toValue = (__bridge id _Nullable)([[self rectPathSquishHorizontal] CGPath]);
    wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration;
    wobbleAnimation2.duration = animationDuration;
    
    // 3
    CABasicAnimation *wobbleAnimation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    wobbleAnimation3.fromValue = (__bridge id _Nullable)([[self rectPathSquishHorizontal] CGPath]);
    wobbleAnimation3.toValue = (__bridge id _Nullable)([[self rectPathSquishVertical] CGPath]);
    wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration;
    wobbleAnimation3.duration = animationDuration;
    
    // 4
    CABasicAnimation *wobbleAnimation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    wobbleAnimation4.fromValue = (__bridge id _Nullable)([[self rectPathSquishVertical] CGPath]);
    wobbleAnimation4.toValue = (__bridge id _Nullable)([[self rectPathSquishHorizontal] CGPath]);
    wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration;
    wobbleAnimation4.duration = animationDuration;

    int repeatCount = 2;
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = [NSArray arrayWithObjects:wobbleAnimation1, wobbleAnimation2, wobbleAnimation3, wobbleAnimation4, nil];
    animationGroup.duration = wobbleAnimation4.beginTime + wobbleAnimation4.duration;
    animationGroup.repeatCount = repeatCount;
    [self addAnimation:animationGroup forKey:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:(wobbleAnimation4.beginTime + wobbleAnimation4.duration)*repeatCount target:self selector:@selector(finalStage) userInfo:nil repeats:NO];
}

- (UIBezierPath *) rectPathFinal {
    CGFloat size = [UIScreen mainScreen].bounds.size.height;
    CGFloat xPos = [UIScreen mainScreen].bounds.size.width/2-size/2;
    CGFloat yPos = [UIScreen mainScreen].bounds.size.height/2-size/2;
    return [UIBezierPath bezierPathWithRect:CGRectMake(xPos, yPos, size, size)];
}

@end
