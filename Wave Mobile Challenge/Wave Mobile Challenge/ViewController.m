//
//  ViewController.m
//  Wave Mobile Challenge
//
//  Created by Greg on 2016-03-13.
//  Copyright © 2016 Rooh Bear corp. All rights reserved.
//

#import "ViewController.h"
#import "ProductTableViewCell.h"


////////////////////////////////////
@interface ViewController ()

@property (nonatomic, retain) IBOutlet UIImageView				*imageviewBackground;
@property (nonatomic, retain) IBOutlet UITableView				*tableviewProducts;
@property (assign) int											nBackgroundImageNum;
@property (assign) int											nBackgroundImageNumDirection;

// "Please Wait dialog" UI bits
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView	*activityIndicator;
@property (nonatomic, retain) IBOutlet UIView					*viewPleaseWait;
@property (nonatomic, retain) IBOutlet UILabel					*labelPleaseWaitMessage;
@property (nonatomic, retain) IBOutlet UIButton					*buttonPleaseWaitOK;

// an array of ProductInfo objects (used for the table)
@property (nonatomic, retain) NSArray							*arrProducts;

@end


///////////////////////////////////////
@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// listen for if the user wants to retry the download
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doRetryDownload:) name:kNOTIFICATION_RETRY_DOWNLOAD object:nil];

	[self loadProducts];

	self.tableviewProducts.layer.borderColor = [[UIColor blackColor] CGColor];
	self.tableviewProducts.layer.cornerRadius = 10.0;
	self.tableviewProducts.layer.borderWidth = 2;
	
	self.nBackgroundImageNum = 1;
	self.nBackgroundImageNumDirection = 1;
	[self performSelector:@selector(changeBackground) withObject:nil afterDelay:0.1];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// called on main thread every few seconds to cycle the background graphic
- (void)changeBackground
{
	self.nBackgroundImageNum += self.nBackgroundImageNumDirection;
	if(self.nBackgroundImageNum > 72 || self.nBackgroundImageNum == 1) {
		self.nBackgroundImageNumDirection *= -1;
	}
	
	NSString *strFilename = [NSString stringWithFormat:@"ace_%03d.jpg", self.nBackgroundImageNum];
	self.imageviewBackground.image = [UIImage imageNamed:strFilename];
	
	// come back in a second and do it again...
	[self performSelector:@selector(changeBackground) withObject:nil afterDelay:0.1];
}

// called when we hear the kNOTIFICATION_RETRY_DOWNLOAD notification
- (void)doRetryDownload:(NSNotification *)n
{
	[self loadProducts];
}

// called on main thread to download the list of products
- (void)loadProducts
{
	// show the 'please wait' dialog
	self.viewPleaseWait.hidden = NO;
	self.viewPleaseWait.layer.borderColor = [[UIColor blackColor] CGColor];
	self.viewPleaseWait.layer.cornerRadius = 10.0;
	self.viewPleaseWait.layer.borderWidth = 2.0;

	[self performSelectorInBackground:@selector(loadProductsInBackground) withObject:nil];
}

// called when "OK" button in Please Wait dialog is clicked
- (IBAction)buttonPleaseWaitOKClicked:(id)sender
{
	self.viewPleaseWait.hidden = YES;
}

// called on background thread to download the list of products
- (void)loadProductsInBackground
{
	NSError	*err = nil;
	NSURL	*url = [NSURL URLWithString:@"https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/?access_token=a3wgC2KbJlzcoGdDbClUOaFrBgMYAR"];
	NSData	*dataRaw = [[NSData alloc] initWithContentsOfURL:url];
	
	if(dataRaw.length > 0) {
		self.arrProducts = [NSJSONSerialization JSONObjectWithData:dataRaw options:NSJSONReadingMutableLeaves error:&err];
		[self performSelectorOnMainThread:@selector(loadProductsDone:) withObject:nil waitUntilDone:NO];
	}else{
		[self performSelectorOnMainThread:@selector(loadProductsDone:) withObject:@"Error downloading" waitUntilDone:NO];
	}
}

// called on main thread when products are done loading (or an error occured)
- (void)loadProductsDone:(NSString *)strErrorMessage
{
	if(strErrorMessage) {
		// got an error! hide the spinner and show the OK button to dismiss the dialog
		self.activityIndicator.hidden = YES;
		self.labelPleaseWaitMessage.text = strErrorMessage;
		self.buttonPleaseWaitOK.hidden = NO;
		self.buttonPleaseWaitOK.backgroundColor = [UIColor whiteColor];
		self.buttonPleaseWaitOK.layer.borderColor = [[UIColor darkGrayColor] CGColor];
		self.buttonPleaseWaitOK.layer.borderWidth = 1;
		self.buttonPleaseWaitOK.layer.cornerRadius = 10.0;
		
		NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Error downloading products", @"name", nil];
		self.arrProducts = [[NSMutableArray alloc] initWithObjects:dict, nil];
	}else{
		// no error! hide the dialog and refresh the table
		self.viewPleaseWait.hidden = YES;
	}
	
	[self.tableviewProducts reloadData];
}

#pragma mark - UITableView datasource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.arrProducts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ProductTableViewCell *ret = [tableView dequeueReusableCellWithIdentifier:@"gregCell"];
	if(!ret) {
		ret = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"gregCell"];
	}
	
	if(self.arrProducts.count == 1 && ret.labelDesc.text.length == 0) {
		// let's display an error message
		ret.buttonRetry.hidden = NO;

		ret.buttonRetry.backgroundColor = [UIColor whiteColor];
		ret.buttonRetry.layer.borderWidth = 1;
		ret.buttonRetry.layer.borderColor = [[UIColor blackColor] CGColor];
		ret.buttonRetry.layer.cornerRadius = 10.0;
	}else{
		// let's display a real product
		ret.buttonRetry.hidden = YES;

		NSDictionary *product = self.arrProducts[indexPath.row];
		ret.labelName.text = product[@"name"];
		ret.labelDesc.text = product[@"description"];
		
		double dblPrice = [product[@"price"] doubleValue];
		ret.labelAmount.text = [NSString stringWithFormat:@"$%.2f", dblPrice];
	}
	
	return ret;
}

@end
