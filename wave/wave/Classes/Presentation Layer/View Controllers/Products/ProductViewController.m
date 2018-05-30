//
//  ViewController.m
//  wave
//
//  Created by Armen Mkrtchyan on 5/29/18.
//  Copyright © 2018 Armen Mkrtchyan. All rights reserved.
//

#import "ProductViewController.h"

// Service
#import "ServiceProduct.h"

// View
#import "TableViewCellProduct.h"

// View model
#import "VMProductCell.h"

@interface ProductViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TableViewDataSource *dataSourceProduct;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) ServiceProduct *serviceProduct;
@end

@implementation ProductViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _serviceProduct = [[ServiceProduct alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self setupNotificationHandlers];
    [self setupNavigationTitle];
    [self setupTableView];
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self syncData];
}

- (void)setupNavigationTitle {
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.title = @"Product";
}

- (void)setupTableView {
    
    // Initilaize collection view.
    @weakify(self);
    TableViewCellBlock configureCell = ^(id cell, VMProductCell *item) {
        
        @strongify(self);
        [cell configureCell:item];
        if ([cell respondsToSelector:@selector(setDelegate:)]) {
            
            [cell performSelector:@selector(setDelegate:) withObject:self];
        }
    };
    
    self.dataSourceProduct = [[TableViewDataSource alloc] initWithItems:@[]
                                                            cellIdentifier:NSStringFromClass(TableViewCellProduct.self)
                                                        configureCellBlock:configureCell];
    
    
    [self.tableView setDataSource:self.dataSourceProduct];
    [self.tableView setDelegate:self];
    [self.tableView setScrollsToTop:YES];
    
    self.tableView.tableFooterView = [UIView new];
    
    // Refresh control
    [self setupRefreshControl];
}

- (void)setupRefreshControl {
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self action:@selector(syncData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

- (void)setupNotificationHandlers {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshData:)
                                                 name:NotificationRefreshData
                                               object:nil];
}

- (void)refreshData:(NSNotification *)notification {
    
    NSString *entity = notification.object;
    if ([entity isEqualToString:SyncDataProduct]) {
        
        [self loadData];
    }
}

- (void)syncData {
    
    @weakify(self);
    [self.serviceProduct getProducts:WaveBusinessId
                     completionBlock:^(id data, ErrorDataModel *error) {
                         
                         @strongify(self);
                         [self.refreshControl endRefreshing];
                         if (!error) {
                             
                             [self loadData];
                         }
                         else {
                             
                             [self handleConnectionError:error];
                         }
                     }];
}

- (void)loadData {
    
    self.dataSourceProduct.items = [[self.serviceProduct getProducts] mutableCopy];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
