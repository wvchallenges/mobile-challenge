//
//  UIViewController+Additions.m
//  Core
//
//  Created by Armen Mkrtchyan on 11/25/15.
//  Copyright © 2015 Armen Mkrtchian. All rights reserved.
//

#import "UIViewController+Additions.h"

#import "TBAlertController.h"

#import "SVProgressHUD.h"

//#import <objc/runtime.h>

//static char const * const KeyActivityIndicator = "activityIndicator";

@implementation UIViewController (Additions)

//@dynamic activityIndicator;

#pragma mark - Activity Indicator -
- (void)showActivityIndicator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
//        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD show];
    });
}

- (void)hideActivityIndicator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [SVProgressHUD dismiss];
    });
}

- (void)handleConnectionError:(ErrorDataModel *)error {
    
    NSInteger code = [error.statusCode integerValue];
    NSString *message = @"";
    switch (code) {
        case -1005:
        case -1009:
        {
            message = kErrorMessageNoConnection;
        }
            break;
        case 500:
        {
            message = kErrorMessageNoServer;
        }
            break;
            
        default:
        {
            message = error.message;
        }
            break;
    }
    
    [self showAlertWithTitle:@""
                     message:message
           cancelButtonTitle:@"Ok"
                otherButtons:nil];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtons:(NSArray *)otherButtons {

    [self showAlertWithTitle:title
                     message:message
           cancelButtonTitle:cancelButtonTitle
          cancelButtonAction:nil
                otherButtons:otherButtons];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
        cancelButtonAction:(TBAlertActionBlock)cancelButtonAction
              otherButtons:(NSArray *)otherButtons {
    
    TBAlertController *alertController = [[TBAlertController alloc] initWithStyle:TBAlertControllerStyleAlert];
    alertController.title = title;
    alertController.message = message;
    
    if ([cancelButtonTitle isKindOfClass:[NSString class]]) {
        
        if (cancelButtonAction) {
            
            [alertController setCancelButtonWithTitle:cancelButtonTitle buttonAction:cancelButtonAction];
        } else {
            
            [alertController setCancelButtonWithTitle:cancelButtonTitle];
        }
    }
    
    for (NSDictionary *otherButton in otherButtons) {
        [alertController addOtherButtonWithTitle:otherButton[@"buttonTitle"] buttonAction:otherButton[@"actionBlock"]];
    }
    
    [alertController showFromViewController:self.navigationController.visibleViewController animated:YES completion:^{
        
    }];
}

- (void)showActionSheetWithTitle:(NSString *)title
                         message:(NSString *)message
               cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtons:(NSArray *)otherButtons {
    
    TBAlertController *alertController = [[TBAlertController alloc] initWithStyle:TBAlertControllerStyleActionSheet];
    alertController.title = title;
    alertController.message = message;
    
    if ([cancelButtonTitle isKindOfClass:[NSString class]]) {
        [alertController setCancelButtonWithTitle:cancelButtonTitle];
    }
    
    for (NSDictionary *otherButton in otherButtons) {
        [alertController addOtherButtonWithTitle:otherButton[@"buttonTitle"] buttonAction:otherButton[@"actionBlock"]];
    }
    
    [alertController showFromViewController:self.navigationController.visibleViewController animated:YES completion:^{
        
    }];
}

- (void)hideKeyboard {
    
    [self.view endEditing:YES];
}
@end
