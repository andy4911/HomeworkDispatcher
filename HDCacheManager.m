//
//  HDCacheManager.m
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDCacheManager.h"
#import "HDDispatch.h"
#import <FMDB.h>

const NSString *createSQL = @"CREATE TABLE IF NOT EXISTS dispatches (id integer primary key autoincrement, content text, fromID text, deadLine text);";
const NSString *insertSQL = @"INSERT INTO dispatches (content, fromID, deadLine) VALUES (?, ?, ?);";
const NSString *selectSQL = @"SELECT * FROM dispatches;";
const NSString *deleteSQL = @"DROP TABLE dispatches;";

static HDCacheManager *cacheManager;

@interface HDCacheManager ()

@property (strong, nonatomic) FMDatabase *dataBase;

@end

@implementation HDCacheManager

+ (instancetype)manager {
    dispatch_once_t token;
    dispatch_once(&token, ^{
        cacheManager = [[HDCacheManager alloc] init];
        
        NSString *path = [cacheManager searchDocumentPath];
        cacheManager.dataBase = [FMDatabase databaseWithPath:path];
        if (![cacheManager open]) {
            NSLog(@"fail to open");
            if (![cacheManager createTable]) {
                NSLog(@"fail to create table");
            }
        }
    });
    return cacheManager;
}

- (BOOL)open {
    return  [self.dataBase open];
}

- (BOOL)insertDispatch:(HDDispatch *)dispatch {
    return [self.dataBase executeUpdate:insertSQL, dispatch.content, dispatch.fromID, [self stringFromDate:dispatch.deadLine]];
}

- (BOOL)createTable {
    BOOL isSuccess = [self.dataBase executeUpdate:createSQL];
    return isSuccess;
}

- (BOOL)deleteDispatches {
    return [self.dataBase executeUpdate:deleteSQL];
}

- (NSArray *)selectDispatches {
    FMResultSet *set = [self.dataBase executeQuery:selectSQL];
    NSMutableArray *dispatches = [[NSMutableArray alloc] init];
    while ([set next]) {
        HDDispatch *dispatch = [[HDDispatch alloc] init];
        dispatch.content = [set stringForColumn:@"content"];
        dispatch.fromID = [set stringForColumn:@"fromID"];
        dispatch.deadLine = [self dateFromString:[set stringForColumn:@"deadLine"]];
        [dispatches addObject:dispatch];
    }
    return dispatches;
}

- (NSString *)searchDocumentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathDoc = [paths firstObject];
    NSString *path = [pathDoc stringByAppendingFormat:@"DispatchesDataBase"];
    return path;
}

- (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

- (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

- (BOOL)insertDispatchs:(NSArray *)dispatches {
    for (HDDispatch *dispatch in dispatches) {
        if ([self insertDispatch:dispatch]) {
            return NO;
        }
    }
    return YES;
}

@end
