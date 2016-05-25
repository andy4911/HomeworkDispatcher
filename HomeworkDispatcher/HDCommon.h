//
//  HDCommon.h
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#ifndef HDCommon_h
#define HDCommon_h

#import <Foundation/Foundation.h>

#define applicationID @"zmI9b7xLOdQEXqj19conkcvu-gzGzoHsz"
#define appKey @"HImXsiqjMImzzBx8JE2nnv23"

typedef void (^HDBooleanResultBlock)(BOOL succeeded, NSError *error);
typedef void (^HDIntegerResultBlock)(NSInteger number, NSError *error);
typedef void (^HDArrayResultBlock)(NSArray *objects, NSError *error);
typedef void (^HDIdResultBlock)(id object, NSError *error);

#endif /* HDCommon_h */
