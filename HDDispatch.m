//
//  HDDispatch.m
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDDispatch.h"
#import <AVObject.h>

@implementation HDDispatch

- (instancetype)initWithAVObject:(AVObject *)object {
    HDDispatch *dispatch = [[HDDispatch alloc] init];
    dispatch.content = [object objectForKey:@"content"];
    dispatch.deadLine = [object objectForKey:@"deadLine"];
    dispatch.fromID = [object objectForKey:@"fromID"];
    return dispatch;
}

@end
