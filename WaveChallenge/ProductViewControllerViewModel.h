//
//  ProductViewControllerViewModel.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PromiseKit.h>
@interface ProductViewControllerViewModel : NSObject

@property (strong,nonatomic,readonly) NSArray* productTableCellViewModels;

// Use catch to report UI Errors
-(PMKPromise*) loadProducts;


@end
