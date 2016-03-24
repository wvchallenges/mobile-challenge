#import "NetworkRequests.h"


@implementation NetworkRequests

+ (void)fetchDataInBackgroundFromStringURL:(NSString *)address withAuthToken:(NSString *)token withCompletionBlock:(void (^)(NSData *returnedData, NSURLResponse *response, NSError *error))completionBlock {
  
  // set session configuration
  NSString *authValue = [NSString stringWithFormat:@"Bearer %@", token];
  NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
  sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization": authValue};
  
  // create the NSURLSession using the above configuration
  NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  [request setURL:[NSURL URLWithString:address]];
  [request setHTTPMethod:@"GET"];
  
  //start the session
  [[session dataTaskWithRequest:request completionHandler:completionBlock] resume];
  
}

@end

