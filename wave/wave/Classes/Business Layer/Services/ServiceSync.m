//
//  ServiceSync.m
//  Core
//
//  Created by Armen Mkrtchyan on 9/3/17.
//  Copyright © 2017 Armen Mkrtchyan. All rights reserved.
//

#import "ServiceSync.h"

// service
#import "ServiceProduct.h"


// view model
#import "Utility.h"
#import <Reachability/Reachability.h>

@interface ServiceSync ()
@property ServiceProduct *serviceProduct;

@property (nonatomic, strong) Reachability *reach;
@property (nonatomic) BOOL isInternetAvailable;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) BOOL syncInProgress;
@end

@implementation ServiceSync

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _serviceProduct = [[ServiceProduct alloc] init];
        
        [self setupNotificationHandlers];
        [self setupReachibility];
        
        self.syncInProgress = NO;
    }
    return self;
}

- (void)setupNotificationHandlers {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(syncFullData)
                                                 name:NotificationSyncData
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cancelSync)
                                                 name:NotificationCancelSync
                                               object:nil];
}

- (void)setupReachibility {
    
    NSLog(@"setupReachibility");
    // Allocate a reachability object
    self.reach = [Reachability reachabilityWithHostname:BaseServerURL];
    
    // Set the blocks
    @weakify(self);
    self.reach.reachableBlock = ^(Reachability*reach) {
        
        @strongify(self);
        // keep in mind this is called on a background thread
        // and if you are updating the UI it needs to happen
        // on the main thread, like this:
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"REACHABLE!");
            [self syncFullData];
        });
    };
    
    self.reach.unreachableBlock = ^(Reachability*reach) {
        
        NSLog(@"UNREACHABLE!");
    };
    
    // Start the notifier, which will cause the reachability object to retain itself!
    [self.reach startNotifier];
}

#pragma mark - SYNC
- (void)syncFullData {
    
    if (self.syncInProgress) {
        
        return;
    }
    
    self.syncInProgress = YES;
    NSLog(@"====== syncFullData ========");
    if ([Utility reachable]) {
        
        [self pullContactsWithCompletionBlock:^(id data, ErrorDataModel *error) {
            
            if (!error) {
                
            }
            else {
                
                [self handleConnectionError:error];
            }
            self.syncInProgress = NO;
        }];
        
    }
    else {
        
        self.syncInProgress = NO;
    }
}

- (void)cancelSync {
    
    [self.serviceProduct cancelAllRequests];
}

#pragma mark - PULL
/*
 * Pull product
 *
 */
- (void)pullContactsWithCompletionBlock:(CompletionBlock)completionBlock {
    
    [self.serviceProduct getProducts:WaveBusinessId
                     completionBlock:^(id data, ErrorDataModel *error) {
                         
                         if (!error) {
                             
                             completionBlock(data, nil);
                         }
                         else {
                             
                             [self handleConnectionError:error];
                         }
                     }];
}

#pragma mark - Sync timer -
- (void)startSyncTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:SyncTime target:self selector:@selector(syncFullData) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)stopSyncTimer {
    
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Private methods -
- (void)handleConnectionError:(ErrorDataModel *)error {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stopSync" object:nil];
    NSInteger code = [error.statusCode integerValue];
    NSString *message = @"";
    switch (code) {
        case -1005:
        case -1009:
        {
            message = kErrorMessageNoConnection;
        }
            break;
        case 500:
        {
            message = kErrorMessageNoServer;
        }
            break;
            
        default:
        {
            message = error.message;
        }
            break;
    }
}

#pragma mark - dealloc
- (void)dealloc {
    
    [self.reach stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
