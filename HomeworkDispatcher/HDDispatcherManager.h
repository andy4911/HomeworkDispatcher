//
//  HDDispatcherManager.h
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

/**
 *  负责接收作业通知的主要类
 */
#import <Foundation/Foundation.h>
#import "HDCommon.h"

@class HDDispatch;

@protocol DispatcherManagerDelegate <NSObject>

@required

- (void)didReceiveDispatch:(HDDispatch *)dispatch;

@end


@interface HDDispatcherManager : NSObject

@property (strong, nonatomic) id<DispatcherManagerDelegate> delegate;

+ (instancetype)manager;

/**
 *  获取本月作业记录，联网状态则从网上取，否则从本地缓存取
 *
 *  @param block (NSArray<HDDispatch *> *objects, NSError *error)
 */
- (void)getRecodersWithBlock:(HDArrayResultBlock)block;

@end
