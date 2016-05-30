//
//  HDDispatcherManager.m
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDDispatcherManager.h"
#import "HDCacheManager.h"
#import <AVOSCloud.h>
#import <SystemConfiguration/SystemConfiguration.h>

static HDDispatcherManager *dispatcherManager;

@interface HDDispatcherManager ()

@property (strong, nonatomic) HDCacheManager *cacheManager;

@end

@implementation HDDispatcherManager

+ (instancetype)manager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        dispatcherManager = [[HDDispatcherManager alloc] init];
        dispatcherManager.cacheManager = [HDCacheManager manager];
    });
    return dispatcherManager;
}

- (void)getRecodersWithBlock:(HDArrayResultBlock)block {
    AVUser *currentUser = [AVUser currentUser];
    NSDictionary *group = [currentUser objectForKey:@"Group"];
    NSString *groupString = [self stringWithDictionaryValues:group];
    
    if ([self connectedToNetwork]) {
        AVQuery *qGroup = [AVQuery queryWithClassName:@"Groups"];
        [qGroup whereKey:@"GroupName" equalTo:groupString];
        [qGroup findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                block(nil, error);
            } else {
                AVObject *group = [objects firstObject];
                AVRelation *dispatches = [group objectForKey:@"Dispatches"];
                AVQuery *qDispatches = [dispatches query];
                [qDispatches findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    if (error) {
                        block(nil, error);
                    } else {
                        block(objects, error);
                        [self.cacheManager selectDispatches];
                        [self.cacheManager insertDispatchs:objects];
                    }
                }];
            }
        }];
    }
}

- (NSString *)stringWithDictionaryValues:(NSDictionary *)dict {
    NSString *string = @"";
    NSArray *keys = [dict allKeys];
    for (NSString *key in keys) {
        string = [string stringByAppendingString:[dict objectForKey:key]];
    }
    return string;
}

- (BOOL)connectedToNetwork {
    struct sockaddr_storage zeroAddress;
    
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.ss_len = sizeof(zeroAddress);
    zeroAddress.ss_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable&&!needsConnection) ? YES : NO;
}

@end
