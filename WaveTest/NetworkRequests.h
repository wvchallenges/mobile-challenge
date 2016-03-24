#import <Foundation/Foundation.h>


@interface NetworkRequests : NSObject

+ (void)fetchDataInBackgroundFromStringURL:(NSString *)address withAuthToken:(NSString *)token withCompletionBlock:(void (^)(NSData *returnedData, NSURLResponse *response, NSError *error))completionBlock;

@end
