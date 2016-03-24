#import <XCTest/XCTest.h>

#import "NetworkRequests.h"


@interface NetworkRequestTests : XCTestCase

@end


@implementation NetworkRequestTests

- (void)setUp {
  
  [super setUp];
}

- (void)tearDown {
  
  [super tearDown];
}

- (void)testAsynchronousFetchForJSONFromWaveDeveloperAPI {
  
  XCTestExpectation *expectation = [self expectationWithDescription:@"Asychronous request to Wave Developer API for JSON array."];
  
  NSString *waveDeveloperAPIString= @"https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/";
  NSString *waveDeveloperTokenString = @"d1hQ2z5dedmPGq8wVqU3vFLP4OstFh";
  
  [NetworkRequests fetchDataInBackgroundFromStringURL:waveDeveloperAPIString withAuthToken:waveDeveloperTokenString withCompletionBlock:^(NSData *returnedData, NSURLResponse *response, NSError *error) {
    if (error) {
      NSLog(@"Error is: %@", error);
    } else {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = [httpResponse statusCode];
      XCTAssertEqual(statusCode, 200);
      [expectation fulfill];
    }
  }];
  
  [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
    if (error) {
      XCTFail(@"Expectation failed with error: %@", error);
    }
  }];
}


@end
