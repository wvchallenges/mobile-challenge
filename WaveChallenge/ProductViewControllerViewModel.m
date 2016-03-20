//
//  ProductViewControllerViewModel.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "ProductViewControllerViewModel.h"
#import "NetworkingManager.h"
#import "BusinessProductModel.h"
#import "ProductTableViewCell.h"
@interface ProductViewControllerViewModel ()
@property (strong,nonatomic,readwrite) NSArray* productTableCellViewModels;
@property (strong,nonatomic) NetworkingManager* manager;
@end

@implementation ProductViewControllerViewModel

-(instancetype) init {
    if(!(self=[super init])) {return nil;}
    self.manager = [NetworkingManager sharedInstance];
    return self;
}

// Should only catch the promise.
-(PMKPromise*) loadProducts {
    
    __weak typeof(self) weakSelf = self;
    return [self.manager
            retrieveProductsFromBusinessId:@"89746d57-c25f-4cec-9c63-34d7780b044b"].then (^(NSArray* businessProducts){
            // convert into product tableViewCell Models
        NSMutableArray* result = [NSMutableArray array];
        
        for(BusinessProductModel* model in businessProducts) {
            ProductTableCellViewModel* pvm = [[ProductTableCellViewModel alloc] initWithProductName:model.productName andProductPrice:model.price];
            [result addObject:pvm];
        }
        
        weakSelf.productTableCellViewModels = result;
    });
}


@end
