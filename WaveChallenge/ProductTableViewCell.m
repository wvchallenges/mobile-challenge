//
//  ProductTableViewCell.m
//  WaveChallenge
//
//  Created by Michael Chung on 3/18/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "ProductTableViewCell.h"
#import <KVOController/FBKVOController.h>

@interface ProductTableViewCell()

@property (strong,nonatomic) FBKVOController* kvo;

@end
@implementation ProductTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.kvo = [[FBKVOController alloc] initWithObserver:self];
    __weak typeof(self) weakSelf = self;
    [self.kvo observe:self
              keyPath:@"vm"
              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                block:^(id observer, id object, NSDictionary *change) {
                    weakSelf.productNameLabel.text = [weakSelf labelStringForName:weakSelf.vm.productName];
                    weakSelf.productPriceLabel.text = [weakSelf labelStringForDecimal:weakSelf.vm.productPrice];
    }];
}

-(NSString*) labelStringForDecimal:(NSDecimalNumber*) decimal {
    return [NSString stringWithFormat:@"Price: %@",[decimal stringValue]];
}

-(NSString*) labelStringForName:(NSString*) name {
    return [NSString stringWithFormat:@"Name: %@",name];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)prepareForReuse {
    self.productNameLabel.text = nil;
    self.productPriceLabel.text = nil;
}

@end
