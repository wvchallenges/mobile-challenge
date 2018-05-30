//
//  NetworkProduct.h
//  Core
//
//  Created by armen on 6/6/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "BaseNetwork.h"

@interface NetworkProduct : BaseNetwork
- (void)getProduct:(NSString *)productId completionBlock:(CompletionBlock)completionBlock;
@end
