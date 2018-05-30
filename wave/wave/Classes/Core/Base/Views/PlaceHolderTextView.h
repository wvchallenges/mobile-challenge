//
//  PlaceHolderTextView.h
//  Core
//
//  Created by Armen Mkrtchyan on 11/2/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseTextView.h"

IB_DESIGNABLE
@interface PlaceHolderTextView : BaseTextView

@property (nonatomic, retain) IBInspectable NSString *placeholder;
@property (nonatomic, retain) IBInspectable UIColor *placeholderColor;

- (void)textChanged:(NSNotification*)notification;

@end
