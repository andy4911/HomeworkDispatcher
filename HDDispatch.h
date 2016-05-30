//
//  HDDispatch.h
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 代表一条作业消息
@class AVObject;

@interface HDDispatch : NSObject

@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *fromID;
@property (strong, nonatomic) NSDate *deadLine;

- (instancetype)initWithAVObject:(AVObject *)object;

@end
