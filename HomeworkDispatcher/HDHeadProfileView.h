//
//  HDHeadProfileView.h
//  profile
//
//  Created by Apple on 16/6/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDHeadProfileView : UIView

@property (assign, nonatomic) NSUInteger times;
@property (assign, nonatomic) NSUInteger grades;
@property (strong, nonatomic) NSString *evaluate;
@property (strong, nonatomic) UIImage *portraitImage;
@property (strong, nonatomic) NSString *detailTitle;

- (void)layOut;

@end