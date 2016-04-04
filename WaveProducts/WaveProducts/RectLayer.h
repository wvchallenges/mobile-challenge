//
//  CircleLayer.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AnimationLayerDelegate.h"

@interface RectLayer : CAShapeLayer

@property (strong, nonatomic) id <AnimationLayerDelegate> parentViewDelegate;;

- (void) expand;

@end
