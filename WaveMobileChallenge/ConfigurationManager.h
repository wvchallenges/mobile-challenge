//
//  ConfigurationManager.h
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class is used to gain access to values stored in environments.plist
 */
@interface ConfigurationManager : NSObject

/**
 Get base server URL
 */
- (NSString *)apiServerBaseURL;

/**
 Get business ID
 */
- (NSString *)businessID;

/**
 Get access token
 */
- (NSString *)accessToken;

@end
