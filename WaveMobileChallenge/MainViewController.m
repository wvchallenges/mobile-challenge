//
//  MainViewController.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "MainViewController.h"
#import "ProductFetcherService.h"
#import "Product.h"

@interface MainViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSArray<Product *> *products;

@property (nonatomic, assign) BOOL loading;

@end

@implementation MainViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Products";
    
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.products)
    {
        [self loadData];
    }
}

#pragma mark - Other Methods

- (void) setLoading:(BOOL)loading
{
    _loading = loading;
    
    if (_loading)
    {
        [self.activityIndicator startAnimating];
        [self.tableView setHidden:YES];
    }
    else
    {
        [self.activityIndicator stopAnimating];
        [self.tableView setHidden:NO];
    }
}

- (void)loadData
{
    self.loading = YES;
    
    __weak typeof(self) weakSelf = self;
    
    [self.productFetcherService fetchProducts:^(NSArray<Product *> *products) {
        
        weakSelf.loading = NO;
        
        weakSelf.products = products;
        [weakSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        weakSelf.loading = NO;
        [weakSelf showRetryDialog];
        
    }];
}

- (void)showRetryDialog
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Couldn't load products data!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *retryAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        [self loadData];
    }];
    
    [alertController addAction:retryAction];
    
    [self presentViewController: alertController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: cellId];
    }
    
    Product *product = self.products[indexPath.row];
    
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"$%.2f", product.price];
    
    return cell;
}

@end
