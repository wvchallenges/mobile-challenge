//
//  ProductsViewController.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsViewController.h"
#import "OpenAnimationView.h"
#import "ProductsNetworkManager.h"
#import "Product.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self runAnimation];
    [[ProductsNetworkManager sharedManager] getProductsWithCompletion:^(BOOL success, NSArray *products, NSError *error) {
        if (success) {
            for (Product *product in products) {
                NSLog(@"%@", product.name);
            }
        } else {
            // @TODO Warn user.
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) runAnimation {
    OpenAnimationView* openAnimation = [[OpenAnimationView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:openAnimation];
    [openAnimation startAnimation];
}

@end
