//
//  UIViewController+Additions.h
//  Core
//
//  Created by Armen Mkrtchyan on 11/25/15.
//  Copyright © 2015 Armen Mkrtchian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

//@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

- (void)handleConnectionError:(ErrorDataModel *)error;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
        cancelButtonAction:(void (^)(NSArray *))cancelButtonAction
              otherButtons:(NSArray *)otherButtons;

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtons:(NSArray *)otherButtons;

- (void)showActionSheetWithTitle:(NSString *)title
                         message:(NSString *)message
               cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtons:(NSArray *)otherButtons;

- (void)hideKeyboard;
@end
