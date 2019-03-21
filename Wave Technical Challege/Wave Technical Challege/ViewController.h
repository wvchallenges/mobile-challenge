//
//  ViewController.h
//  Wave Technical Challege
//
//  Created by Binoli Mhatre on 2019-03-18.
//  Copyright © 2019 Binoli Mhatre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *productsArray;
}
@property (strong, nonatomic) IBOutlet UITableView *productsTable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end

