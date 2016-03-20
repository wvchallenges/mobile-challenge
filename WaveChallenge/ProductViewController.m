//
//  ViewController.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductViewControllerViewModel.h"
#import <KVOController/FBKVOController.h>
#import "ProductTableViewCell.h"
@interface ProductViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) ProductViewControllerViewModel* vm;
@property (strong,nonatomic) FBKVOController* kvo;
@end

@implementation ProductViewController

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    if(!(self=[super initWithCoder:aDecoder])) {return nil;}
    self.kvo = [[FBKVOController alloc] initWithObserver:self];
    self.vm = [[ProductViewControllerViewModel alloc] init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.vm loadProducts].catch(^(NSError* error) {
        // Show error if there is one otherwise we are good watch the ViewModel!
        NSLog(@"Error Loading: %@",[error description]);
    });
    
    // Do any additional setup after loading the view, typically from a nib.
    __weak typeof(self) weakSelf = self;
    
    // Watch the view model
    [self.kvo observe:self.vm keyPath:@"productTableCellViewModels"
              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                block:^(id observer, id object, NSDictionary *change) {
                    [weakSelf.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.vm.productTableCellViewModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellId = @"CellId";
    ProductTableViewCell* pvc = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    pvc.vm = [self.vm.productTableCellViewModels objectAtIndex:[indexPath row]];
    return pvc;
    
}



@end
