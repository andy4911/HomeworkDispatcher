//
//  JJCommon.h
//  JobJun
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#ifndef JJCommon_h
#define JJCommon_h

#import <Foundation/Foundation.h>

#define applicationID @"zmI9b7xLOdQEXqj19conkcvu-gzGzoHsz"
#define appKey @"HImXsiqjMImzzBx8JE2nnv23"

typedef void (^JJBooleanResultBlock)(BOOL succeeded, NSError *error);
typedef void (^JJIntegerResultBlock)(NSInteger number, NSError *error);
typedef void (^JJArrayResultBlock)(NSArray *objects, NSError *error);
typedef void (^JJIdResultBlock)(id object, NSError *error);

#endif /* JJCommon_h */
