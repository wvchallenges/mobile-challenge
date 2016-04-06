//
//  OpenAnimationView.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenAnimationView : UIView

// Convience
- (instancetype) initWithFrame:(CGRect)frame bgColor:(UIColor *)color
                     andParent:(UIView *)parent;


// Actionable.
- (void) startAnimation;

@end
