//
//  ProductsViewController.m
//  WaveProducts
//
//  Created by Shawn Simon on 2016-03-31.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductsViewModel.h"
#import "ProductTableViewCell.h"

#import "OpenAnimationView.h"

@interface ProductsViewController () <ProductsViewModelDelegate, UITableViewDataSource, UITableViewDelegate>

// Storyboard Properties
@property (strong, nonatomic) IBOutlet UITableView *productsTableView;

// Properties
@property (strong, nonatomic) NSArray *products;
@property (strong, nonatomic) ProductsViewModel *viewModel;

@end

@implementation ProductsViewController

#pragma - mark
#pragma - mark Setup

// Required for storyboards.
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self construct];
    }
    return self;
}

// If not used with storyboards.
- (instancetype) init {
    if (self = [super init]) {
        [self construct];
    }
    return self;
}

- (void) construct {
    self.viewModel = [[ProductsViewModel alloc] init];
    self.viewModel.modelViewDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) runAnimation {
    OpenAnimationView* openAnimation = [[OpenAnimationView alloc] initWithFrame:self.view.bounds bgColor:[UIColor whiteColor] andParent:self];
    [openAnimation startAnimation];
}

#pragma - mark
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

#pragma - mark
#pragma - mark ModelViewDelegate

- (void) recieveProducts:(NSArray *)products {
    self.products = products;
    [self.productsTableView reloadData];
}

@end
