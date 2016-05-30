//
//  HDCacheManager.h
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDDispatch;

@interface HDCacheManager : NSObject

+ (instancetype)manager;

- (BOOL)insertDispatch:(HDDispatch *)dispatch;

- (BOOL)insertDispatchs:(NSArray *)dispatches;

- (NSArray *)selectDispatches;

- (BOOL)deleteDispatches;

@end

