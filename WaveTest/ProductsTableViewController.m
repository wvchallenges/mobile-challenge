#import "ProductsTableViewController.h"

#import "NetworkRequests.h"
#import "Product.h"

static NSString * const kWaveDeveloperAPI = @"https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/";
static NSString * const kWaveDeveloperToken = @"d1hQ2z5dedmPGq8wVqU3vFLP4OstFh";


@interface ProductsTableViewController ()

@property (strong, nonatomic) NSMutableArray *waveProducts;

@end


@implementation ProductsTableViewController

#pragma mark - NSObject

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.waveProducts = [[NSMutableArray alloc] init];
  
  [self fetchProductsInBackground:self.waveProducts];
  [self configureUI];
}

#pragma mark - Configure UI

- (void)configureUI {
  
  [self configureNavBar];
}

- (void)configureNavBar {
  
  self.navigationItem.title = @"My Products";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  if (self.waveProducts)
    return [self.waveProducts count];
  else
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell" forIndexPath:indexPath];
  [self configureCell:cell atIndexPath:indexPath];
  return cell;
}

#pragma mark - Table view helpers

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  
  if (self.waveProducts) {
    Product *myProduct = [self.waveProducts objectAtIndex:indexPath.row];
    cell.textLabel.text = myProduct.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", [myProduct.price doubleValue]];
  }
}

#pragma mark - Data

- (void)fetchProductsInBackground:(NSMutableArray *)myProducts {
  
  [NetworkRequests fetchDataInBackgroundFromStringURL:kWaveDeveloperAPI withAuthToken:kWaveDeveloperToken withCompletionBlock:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    // first, check for errors
    if (data == nil) {
      NSLog(@"Query failed!");
      return;
    }
    if (error) {
      NSLog(@"Error fetching product date. Description is %@", error);
      return;
    }
    NSError *jsonError = nil;
    NSArray *userData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (jsonError) {
      NSLog(@"JSON was malformed. Error is %@", jsonError);
      return;
    }
    
    // then, read and save data
    for (NSDictionary *product in userData) {
      NSString *name = [product objectForKey:@"name"];
      NSNumber *price = [NSNumber numberWithInt:[[product valueForKey:@"price"] doubleValue]];
      Product *newProduct = [[Product alloc] initWitName:name withPrice:price];
      [myProducts addObject:newProduct];
    }
    
    // finally, always update UI on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.tableView reloadData];
    });
  }];
}

@end
