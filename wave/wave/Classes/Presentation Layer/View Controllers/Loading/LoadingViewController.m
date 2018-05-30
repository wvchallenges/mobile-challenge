//
//  LoadingViewController.m
//  Core
//
//  Created by Armen Mkrtchian on 9/24/15.
//  Copyright (c) 2015 Armen Mkrtchian. All rights reserved.
//

#import "LoadingViewController.h"

// controller
#import "ProductViewController.h"

@interface LoadingViewController ()
@end

@implementation LoadingViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self loadData];
}

- (void)loadData {
    
    [self openHomeVC];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)openHomeVC {
    
    ProductViewController *productsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductVC"];
    [self.navigationController setViewControllers:@[productsVC] animated:NO];
}

@end
