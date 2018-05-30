//
//  BaseViewController.m
//  Core
//
//  Created by Armen Mkrtchian on 10/15/14.
//  Copyright (c) 2014 Armen Mkrtchian. All rights reserved.
//

#import "BaseViewController.h"

#import "ErrorDataModel.h"

@interface BaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
//    self.view.frame = kScreenBounds;
//    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self trackCurrentScreen];
}

- (void)viewWillDisappear:(BOOL)animated {
    
//    [self hideActivityIndicator];
    [super viewWillDisappear:animated];
}

//- (void)presentActivityViewController:(NSArray *)objectsToShare {
//    
//    UIActivityViewController *activityVC = [TDUtility shareActivityVCForObjects:objectsToShare];
//    [self presentViewController:activityVC animated:YES completion:nil];
//}

- (void)trackCurrentScreen {
    NSString *currentVCName = NSStringFromClass([self class]);
    if ([currentVCName isKindOfClass:[NSString class]]) {
        currentVCName = [currentVCName stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    }
}

- (void)trackScreenWithName:(NSString *)screenName {
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
//    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
//    [tracker set:kGAIScreenName value:screenName];
    // New SDK versions
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}


#pragma mark - Status Bar -
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    
    return UIStatusBarAnimationFade;
}

- (BOOL)prefersStatusBarHidden {
    
    return self.statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden {
    
    _statusBarHidden = statusBarHidden;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return UIInterfaceOrientationPortrait;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
