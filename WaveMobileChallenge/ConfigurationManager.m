//
//  ConfigurationManager.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "ConfigurationManager.h"

NSString * const kEnvironmentsPlistFileName = @"Environments";
NSString * const kBaseSettingsKey = @"waveapps_base_url";
NSString * const kBusinessIDKey = @"business_id";
NSString * const kAccessTokenKey = @"access_token";

//Store the access token as a hex to add some level of security
unsigned char const AccessToken[] = { 0x42, 0x65, 0x61, 0x72, 0x65, 0x72, 0x20, 0x62, 0x62, 0x56, 0x59, 0x49, 0x4e, 0x45, 0x31, 0x36, 0x41, 0x31, 0x53, 0x55, 0x57, 0x51, 0x64, 0x54, 0x46, 0x54, 0x30, 0x62, 0x41, 0x55, 0x70, 0x50, 0x72, 0x41, 0x7a, 0x49, 0x54};


@interface ConfigurationManager ()

@property (nonatomic, strong) NSDictionary *environmentSettings;

@end

@implementation ConfigurationManager

- (id) init
{
    if (self = [super init])
    {
        self.environmentSettings = [[NSDictionary alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource: kEnvironmentsPlistFileName ofType: @"plist"]];
        
        if (self.environmentSettings)
        {
            DLog(@"Environment Settings: %@", self.environmentSettings);
        }
    }
    
    return self;
}

- (NSString *)apiServerBaseURL
{
    return self.environmentSettings[kBaseSettingsKey];
}


- (NSString *)businessID
{
    return self.environmentSettings[kBusinessIDKey];
}

- (NSString *)accessToken
{
    NSString *token = [NSString stringWithUTF8String:(char *)AccessToken];
    
    return token;
}

@end
