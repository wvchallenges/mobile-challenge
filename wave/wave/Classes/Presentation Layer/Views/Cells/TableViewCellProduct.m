//
//  TableViewCellProduct.m
//  Core
//
//  Created by armen on 5/18/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "TableViewCellProduct.h"

#import "VMProductCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface TableViewCellProduct ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;

@property (weak, nonatomic) IBOutlet UILabel *labelAvatar;
@property (nonatomic) NSInteger _id;
@end

@implementation TableViewCellProduct

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.labelAvatar.layer.cornerRadius = 3.0f;
}

- (void)configureCell:(VMProductCell *)item {

    self._id = item._id;
    self.labelName.text = item.name;
    self.labelPrice.text = item.price;
    self.labelAvatar.text = item.letter;
    self.labelAvatar.backgroundColor = item.color;
}

@end
