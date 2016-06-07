 //
//  Authorization.m
//  Joker
//
//  Created by Apple on 16/5/14.
//  Copyright © 2016年 猫儿出墙. All rights reserved.
//

#import "HDAuthorizationManager.h"
#import <AVOSCloud.h>
#import <AVOSCloudSNS.h>
#import <AVUser+SNS.h>

static HDAuthorizationManager *manager;

@interface HDAuthorizationManager ()

@end

@implementation HDAuthorizationManager

+ (instancetype)manager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[HDAuthorizationManager alloc] init];
    });
    return manager;
}

- (BOOL)automaticLogon {
    __block BOOL isSuccess = NO;
    
    AVUser *myUser = [AVUser currentUser];
    if (myUser) {
        [AVUser logInWithUsernameInBackground:myUser.username password:myUser.password block:^(AVUser *user, NSError *error) {
            if (!error) {
                isSuccess = YES;
            }
        }];
    }
    return isSuccess;
}

- (void)thirdPartySignInWithPlateform:(JKSNSType)plateform callBack:(HDBooleanResultBlock)block {
    [AVOSCloudSNS loginWithCallback:^(id object, NSError *error) {
        if (error) {
            NSLog(@"SNS登录失败");
            block(NO, error);
        } else {
            NSString *plateformString = nil;
            switch (plateform) {
                case 1:
                    plateformString = @"weibo";
                    break;
                case 2:
                    plateformString = @"qq";
                    break;
                case 3:
                    plateformString = @"weixin";
                    break;
                default:
                    break;
            }
            [AVUser loginWithAuthData:object platform:plateformString block:^(AVUser *user, NSError *error) {
                if (error) {
                    block(NO, error);
                }
            }];
        }
    } toPlatform:(AVOSCloudSNSType)plateform];
}

- (void)signInWithUserName:(NSString *)name password:(NSString *)password callBack:(HDBooleanResultBlock)block {
    [AVUser logInWithUsernameInBackground:name password:password block:^(AVUser *user, NSError *error) {
        block(YES, error);
    }];
}

- (void)registerWithUserName:(NSString *)name group:(NSDictionary *)dict andPassword:(NSString *)password callBack:(HDBooleanResultBlock)block {
    AVUser *user = [[AVUser alloc] init];
    user.username = name;
    user.password = password;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            AVUser *currentUser = [AVUser currentUser];
            [currentUser setObject:dict forKey:@"group"];
            [currentUser saveInBackground];
            block(YES, error);
        } else {
            NSLog(@"注册失败");
            block(NO, error);
        }
    }];
}


- (void)LoginOut {
    [AVUser logOut];
}

- (void)changPasswordFrom:(NSString *)oldPassword to:(NSString *)newPassword callBack:(AVIdResultBlock)block {
    AVUser *currentUser = [AVUser currentUser];
    [currentUser updatePassword:oldPassword newPassword:newPassword block:^(id object, NSError *error) {
        if (error) {
            NSLog(@"修改密码失败");
            block(object, error);
        }
    }];
}

- (void)findUsersByIDs:(NSArray *)userIDs callBack:(HDArrayResultBlock)block {
    AVQuery *q = [AVUser query];
    [q whereKey:@"objectId" containedIn:userIDs];
    [q findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        block(objects, error);
    }];
}

- (void)findUsersByPartname:(NSString *)name callBack:(HDArrayResultBlock)block {
    AVQuery *q = [AVUser query];
    [q setCachePolicy:kAVCachePolicyNetworkElseCache];
    [q whereKey:@"username" containsString:name];
    AVUser *curUser = [AVUser currentUser];
    [q whereKey:@"objectId" notEqualTo:curUser.objectId];
    [q orderByDescending:@"updatedAt"];
    [q findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        block(objects, error);
    }];
}

- (BOOL)changePortiaitWith:(UIImage *)image {
    AVUser *currentUser = [AVUser currentUser];
    __block BOOL isSucceed = YES;
    
    NSData *imageData = UIImagePNGRepresentation(image);
    AVFile *file = [AVFile fileWithName:@"PortitaitImage" data:imageData];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [currentUser setObject:file.url forKey:@"PortitaitURL"];
            [currentUser saveInBackground];
        } else {
            isSucceed = NO;
        }
    }];
    return isSucceed;
}

- (void)getPortiaitWithBlock:(HDIdResultBlock)block {
    AVUser *user = [AVUser currentUser];
    if (user) {
        NSString *url = [user objectForKey:@"PortitaitURL"];
        
        AVFile *file = [AVFile fileWithURL:url];
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            UIImage *image = [UIImage imageWithData:data];
            block(image, error);
        }];
    }
}

@end
