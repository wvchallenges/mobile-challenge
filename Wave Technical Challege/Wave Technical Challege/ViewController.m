//
//  ViewController.m
//  Wave Technical Challege
//
//  Created by Binoli Mhatre on 2019-03-18.
//  Copyright © 2019 Binoli Mhatre. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#define kWaveURL @"https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"
#define kGoogleURL @"https://www.google.com/"
#define kCellID @"ProductCellID"
#define kProductName @"name"
#define  kProductPrice @"price"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _activityIndicator.center =self.view.center;
    [_activityIndicator startAnimating ];
    [_lblStatus setHidden:true];
    [_productsTable setHidden:true];
    CGFloat statusBarY =[[UIApplication sharedApplication]statusBarFrame].size.height;
    CGRect frame=CGRectMake(0, statusBarY+1, self.view.frame.size.width, self.view.frame.size.height-(statusBarY+1));
    _productsTable.frame=frame;
    _lblStatus.frame=frame;
    
    //Proceed if Internet is avail
    if([self isInternetAvail])
    {
        //Internet available. Load products
        [_productsTable setHidden:false];
        [self callWebService];
    }
    else
    {
        //No Internet. Display status and do nothing
        
        //Stop ActivityIndicator and Update Status
        [_activityIndicator stopAnimating];
        [_activityIndicator setHidden:true];
        [_productsTable setHidden:true];
        [_lblStatus setHidden:false];
        _lblStatus.text=@"Internet Not Available!";
        _lblStatus.textAlignment =NSTextAlignmentCenter;
    }
}

#pragma mark - UITableViewDatasource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = kCellID;
    ProductCell *cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    //Get Product Name
    cell.lblProductName.text = [[productsArray objectAtIndex:indexPath.row] valueForKey:kProductName];
    //lblPrice set X coordinate to match different screen sizes
    CGFloat x= self.view.frame.size.width - cell.lblPrice.frame.size.width;
    CGRect priceFrame=CGRectMake(x, cell.lblPrice.frame.origin.y, cell.lblPrice.frame.size.width, cell.lblPrice.frame.size.height);
    cell.lblPrice.frame=priceFrame;
    //Get Product Price
    NSNumber *price =[[productsArray objectAtIndex:indexPath.row] valueForKey:kProductPrice];
    cell.lblPrice.text = [NSString stringWithFormat:@"$ %@",[price stringValue]];
    
    return cell;
}

#pragma mark - UITableViewDelegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f; //CustomCell height
}


#pragma mark - Internet and WebService Methods
-(BOOL)isInternetAvail
{
    NSURL *googleURL = [NSURL URLWithString:kGoogleURL];
    NSData *data = [NSData dataWithContentsOfURL:googleURL];
    if (data)
    {
        return TRUE; //Available
    }
    return FALSE; //Notavailable
}


-(void) callWebService
{
    NSMutableURLRequest *request = [NSMutableURLRequest new];
     //set request parameters
    request.HTTPMethod = @"GET";
    [request setURL:[NSURL URLWithString:kWaveURL]];
    [request setValue:@"Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm" forHTTPHeaderField:@"Authorization"];
    // NSURLSession
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil  delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,  NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    
    //Stop ActivityIndicator
    [_activityIndicator stopAnimating];
    [_activityIndicator setHidden:true];
        
    if(httpResponse.statusCode==200)
    {//Success
        NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //NSLog(@"Response array: %@", responseArray);
        //Display products
        productsArray =[[ NSMutableArray alloc]initWithArray:responseArray];
        [_productsTable reloadData];
    }
    else
    {//Fail
        //NSLog(@"Request Failed with status code %ld",(long)httpResponse.statusCode);
        
        //Update Status
        [_productsTable setHidden:true];
         [_lblStatus setHidden:false];
        _lblStatus.text=@"Could not retreive products!";
        _lblStatus.textAlignment =NSTextAlignmentCenter;
    }
    
    }];
    [task resume];
}


#pragma mark - MemoryWarning method

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
