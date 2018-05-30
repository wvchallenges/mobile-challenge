//
//  CopyableLabel.m
//  Core
//
//  Created by Armen on 8/14/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "CopyableLabel.h"

@implementation CopyableLabel

#pragma mark Initialization

- (void)attachTapHandler {
    
    [self setUserInteractionEnabled:YES];
    UIGestureRecognizer *touchy = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handleTap:)];
    
    UIGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handleLongPress:)];
    
    [self addGestureRecognizer:touchy];
    [self addGestureRecognizer:longPress];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    [self attachTapHandler];
    
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self attachTapHandler];
}

#pragma mark Clipboard

- (void)copy:(id)sender {
    
//    NSLog(@"Copy handler, label: “%@”.", self.text);
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return (action == @selector(copy:));
}

- (void)handleTap:(UIGestureRecognizer*)recognizer {
    
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        
//        NSLog(@"UIGestureRecognizerStateEnded");
        //Do Whatever You want on End of Gesture
        
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        
//        NSLog(@"UIGestureRecognizerStateBegan.");
        //Do Whatever You want on Began of Gesture
        [self handleTap:sender];
    }
}

- (BOOL)canBecomeFirstResponder {
    
    return YES;
}

@end
