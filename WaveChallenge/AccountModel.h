//
//  AccountModel.h
//  WaveChallenge
//
//  Created by Michael Chung on 3/19/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
@interface AccountModel : MTLModel <MTLJSONSerializing>

@property (strong,nonatomic) NSNumber* id;
@property (strong,nonatomic) NSURL* url;

@end
