//
//  UITextField+JJValidate.h
//  JobJun
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

/**
 *  正则判定
 *
 */

#import <UIKit/UIKit.h>

@interface UITextField (JJValidate)

/*判定是否为空*/

- (BOOL)isEmpty;

/*! 判断邮箱是否正确*/

- (BOOL)validateEmail;

/*! 判断验证码是否正确*/

- (BOOL)validateAuthen;

/*! 判断密码格式是否正确*/

- (BOOL)validatePassword;

/*! 判断手机号码是否正确*/

- (BOOL)validatePhoneNumber;

@end
