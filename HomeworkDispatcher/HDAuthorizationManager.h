//
//  Authorization.h
//  Joker
//
//  Created by Apple on 16/5/14.
//  Copyright © 2016年 猫儿出墙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDCommon.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(int, JKSNSType){
    // 新浪微博
    HDSNSSinaWeibo  =1,
    
    // QQ
    HDSNSQQ         =2,
    
    // 微信
    HDSNSWeiXin      =3,
};

@interface HDAuthorizationManager : NSObject
/**
 *  单例创建
 */
+ (instancetype)manager;

/*
 上次登录若未登出，本次应自动登录
 @return 自动登录成功return YES，自动登录失败return NO需自己登录(因上次登出或此次登录出现问题)
 */
- (BOOL)automaticLogon;

/*
 第三方登录，不存在账号会自动创建
 @param plateform 第三方登录的平台
 @param block The block to execute. The block should have the following argument signature: (Bool  success, NSError *error)
 */
- (void)thirdPartySignInWithPlateform:(JKSNSType)plateform callBack:(HDBooleanResultBlock)block;

/*
 账号登录
 @param block The block to execute. The block should have the following argument signature: (Bool  success, NSError *error)
 @success 这个参数请无视
*/
- (void)signInWithUserName:(NSString *)name password:(NSString *)password callBack:(HDBooleanResultBlock)block;

/**
 *  注册
 *  @param dict     {@“school”:school name, @"college":college name, @"grade":grade, @"class":class} （所有值都是NSString）
 */
- (void)registerWithUserName:(NSString *)name group:(NSDictionary *)dict andPassword:(NSString *)password callBack:(HDBooleanResultBlock)block;

//登出
- (void)LoginOut;

//修改密码
//需要处于登录状态
//@param block The block to execute. The block should have the following argument signature: (id object, NSError *error)
- (void)changPasswordFrom:(NSString *)oldPassword to:(NSString *)newPassword callBack:(HDIdResultBlock)block;

/**
 *  根据一个或多个userID获取相应AVUser
 *
 *  @param userIDs 包含userID的array
 *  @param block
 */
- (void)findUsersByIDs:(NSArray *)userIDs callBack:(HDArrayResultBlock)block;

/**
 *  根据name的一部分获取相应AVUser
 *
 *  @param name
 *  @param block
 */
- (void)findUsersByPartname:(NSString *)name callBack:(HDArrayResultBlock)block;

/**
 *  修改头像
 *
 *  @param image
 */
- (BOOL)changePortiaitWith:(UIImage *)image;

/**
 *  获取当前用户头像
 *
 *  @param block id object 是UIImage类型
 */
- (void)getPortiaitWithBlock:(HDIdResultBlock)block;

@end
