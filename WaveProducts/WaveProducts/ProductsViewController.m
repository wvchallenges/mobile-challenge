//
//  ProductsViewController.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductTableViewCell.h"

#import "OpenAnimationView.h"
#import "ProductsNetworkManager.h"
#import "Product.h"

@interface ProductsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *productsTableView;
@property (strong, nonatomic) NSArray *products;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self runAnimation];
    [self getProducts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) runAnimation {
    OpenAnimationView* openAnimation = [[OpenAnimationView alloc] initWithFrame:self.view.bounds];
    [openAnimation setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:openAnimation];
    [openAnimation startAnimation];
}

- (void) getProducts {
    __weak ProductsViewController *wself = self;
    [[ProductsNetworkManager sharedManager] getProductsWithCompletion:^(BOOL success, NSArray *products, NSError *error) {
        __strong ProductsViewController *sself = wself;
        if (success) {
            sself.products = products;
            [sself.productsTableView reloadData];
        } else {
            // @TODO Warn user.
        }
    }];
}

#pragma - mark TableView

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"productCell" forIndexPath:indexPath];
    [cell setupWithProduct:[self.products objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
