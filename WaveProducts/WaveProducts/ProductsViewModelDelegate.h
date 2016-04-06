//
//  ProductsViewModelDelegate.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-05.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductsViewModelDelegate <NSObject>

@optional
- (void) recieveProducts:(NSArray *)products;
- (void) errorRecieved:(NSError *)error withMessage:(NSString *)message;

@end
