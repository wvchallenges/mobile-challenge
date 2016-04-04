//
//  Common.h
//  WaveProducts
//
//  Created by Shawn Simon on 2016-04-03.
//  Copyright © 2016 Shawn Simon Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

#define API_MODE_DEV 0
#define API_MODE_LIVE 1

// Settings
#define API_MODE     API_MODE_DEV

#if API_MODE == API_MODE_DEV
    #define BASE_URL @"https://api.waveapps.com"
    #define BUSINESS_ID @"89746d57-c25f-4cec-9c63-34d7780b044b"
    #define ACCESS_TOKEN @"QmGeSTFctQf06uWFMQAW1m7pJ4FUQ3"
#elif API_MODE == API_MODE_LIVE
    #define BASE_URL @"https://api.waveapps.com"
    #define BUSINESS_ID @"89746d57-c25f-4cec-9c63-34d7780b044b"
    #define ACCESS_TOKEN @"QmGeSTFctQf06uWFMQAW1m7pJ4FUQ3"
#endif

@end
