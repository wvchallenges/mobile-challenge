//
//  BuildersFactory.m
//  WaveMobileChallenge
//
//  Created by Leon Chen on 2016-03-24.
//  Copyright © 2016 LeonChen. All rights reserved.
//

#import "BuildersFactory.h"
#import "ProductBuilder.h"

@interface BuildersFactory()

@property (nonatomic, strong) ProductBuilder *productBuilder;

@end

@implementation BuildersFactory

- (ProductBuilder *) createProductBuilder
{
    if (self.productBuilder)
    {
        return self.productBuilder;
    }
    
    self.productBuilder = [[ProductBuilder alloc] init];
    
    return self.productBuilder;
}

@end
