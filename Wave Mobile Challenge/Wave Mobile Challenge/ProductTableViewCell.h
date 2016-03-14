//
//  ProductTableViewCell.h
//
//  Created by Greg on 2016-03-13.
//  Copyright © 2016 Rooh Bear corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kNOTIFICATION_RETRY_DOWNLOAD	@"RetryDownload"


///////////////////////////////////////////////////////////
@interface ProductTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel		*labelName;
@property (nonatomic, retain) IBOutlet UILabel		*labelDesc;
@property (nonatomic, retain) IBOutlet UILabel		*labelAmount;
@property (nonatomic, retain) IBOutlet UIButton		*buttonRetry;

@end
