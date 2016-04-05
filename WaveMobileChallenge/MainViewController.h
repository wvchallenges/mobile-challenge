//
//  MainViewController.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductFetcherService;

@interface MainViewController : UIViewController

@property (nonatomic, weak) id <ProductFetcherService> productFetcherService;

@end
