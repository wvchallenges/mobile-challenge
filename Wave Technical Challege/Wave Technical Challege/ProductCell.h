//
//  ProductCell.h
//  Wave Technical Challege
//
//  Created by Binoli Mhatre on 2019-03-20.
//  Copyright © 2019 Binoli Mhatre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell: UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;

@end
