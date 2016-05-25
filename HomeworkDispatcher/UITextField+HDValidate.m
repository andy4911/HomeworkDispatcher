//
//  UITextField+HDValidate.m
//  HomeworkDispatcher
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UITextField+HDValidate.h"

@implementation UITextField (HDValidate)

- (BOOL)isEmpty {
    return self.text.length == 0;
}

- (BOOL)validateEmail {
    return [self validateWithRegExp: @"^[a-zA-Z0-9]{4,}@[a-z0-9A-Z]{2,}\\.[a-zA-Z]{2,}$"];
}

- (BOOL)validateAuthen {
    return [self validateWithRegExp: @"^\\d{5,6}$"];
}

- (BOOL)validatePassword {
    NSString * length = @"^\\w{6,18}$";
    NSString * number = @"^\\w*\\d+\\w*$";
    NSString * lower = @"^\\w*[a-z]+\\w*$";
    NSString * upper = @"^\\w*[A-Z]+\\w*$";
    return [self validateWithRegExp: length] && [self validateWithRegExp: number] && [self validateWithRegExp: lower] && [self validateWithRegExp: upper];
}

- (BOOL)validatePhoneNumber {
    NSString * reg = @"^1\\d{10}$";
    return [self validateWithRegExp: reg];
}

- (BOOL)validateWithRegExp: (NSString *)regExp {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regExp];
    return [predicate evaluateWithObject: self.text];
}

@end
