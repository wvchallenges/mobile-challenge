//
//  ProductTableViewCell.m
//
//  Created by Greg on 2016-03-13.
//  Copyright © 2016 Rooh Bear corp. All rights reserved.
//

#import "ProductTableViewCell.h"


////////////////////////////////////////////////////////////
@implementation ProductTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// called when user clicks the Retry button to retry downloading products
- (IBAction)buttonRetryClicked:(id)sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_RETRY_DOWNLOAD object:nil];
}

@end
