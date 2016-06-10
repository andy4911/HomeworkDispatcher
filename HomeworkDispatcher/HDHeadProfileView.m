//
//  HDHeadProfileView.m
//  profile
//
//  Created by Apple on 16/6/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDHeadProfileView.h"
#import "HDTwoLinesView.h"
#import <Masonry.h>

@interface HDHeadProfileView ()

@property (strong, nonatomic) UIImageView *portraitImageView;
@property (strong, nonatomic) NSArray<NSString *> *titles;
@property (strong, nonatomic) UIView *baseVIew;
@property (strong, nonatomic) UIView *circleView;

@end

@implementation HDHeadProfileView

@synthesize evaluate = _evaluate;
@synthesize portraitImage = _portraitImage;

#pragma mark - setter

- (void)setTimes:(NSUInteger)times {
//    if (!_times) {
//        <#statements#>
//    }
}

- (void)setGrades:(NSUInteger)grades {}

- (void)setEvaluate:(NSString *)evaluate {}

- (void)setPortraitImage:(UIImage *)portraitImage {}

- (void)setDetailTitle:(NSString *)detailTitle {}

#pragma mark - getter

- (UIView *)baseVIew {
    if (!_baseVIew) {
        _baseVIew = [[UIView alloc] init];
        _baseVIew.backgroundColor = [UIColor whiteColor];
        _baseVIew.layer.cornerRadius = 25;
    }
    return _baseVIew;
}

- (UIView *)circleView {
    if (!_circleView) {
        _circleView = [[UIView alloc] init];
        _circleView.backgroundColor = [UIColor whiteColor];
        _circleView.layer.masksToBounds = YES;
    }
    return _circleView;
}

- (UIImageView *)portraitImageView {
    if (!_portraitImageView) {
        _portraitImageView = [[UIImageView alloc] initWithImage:self.portraitImage];
        _portraitImageView.layer.masksToBounds = YES;
    }
    return _portraitImageView;
}

- (NSString *)evaluate {
    if (!_evaluate) {
        _evaluate = @"暂无评价";
    }
    return _evaluate;
}

- (UIImage *)portraitImage {
    if (!_portraitImage) {
        _portraitImage = [UIImage imageNamed:@"SettingsIcon"];
    }
    return _portraitImage;
}

#pragma mark - init

- (void)layOut {
    __weak typeof(self) weakSelf = self;

//    设定基本形状
    
    self.backgroundColor = [UIColor colorWithRed:230.0/255 green:233.0/255 blue:236.0/255 alpha:1];
    
    [self addSubview:self.baseVIew];
    [self.baseVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf).centerOffset(CGPointMake(0, weakSelf.frame.size.height * 1 / 50));
        make.size.equalTo(weakSelf).sizeOffset(CGSizeMake(-weakSelf.frame.size.width *8 /93, -weakSelf.frame.size.height *53 / 127));
    }];
    [self.baseVIew layoutIfNeeded];
    NSLog(@"%f %f", self.baseVIew.frame.size.width, self.baseVIew.frame.size.height);
    
    
    [self.baseVIew addSubview:self.circleView];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.baseVIew).centerOffset(CGPointMake(0, -weakSelf.baseVIew.frame.size.height / 2.1));
        make.size.mas_equalTo(weakSelf.baseVIew.frame.size.width * 38 / 145);
    }];
    [self.circleView layoutIfNeeded];
    self.circleView.layer.cornerRadius = self.circleView.frame.size.width / 2;
    
    
    [self addSubview:self.portraitImageView];
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.circleView);
        make.size.mas_equalTo(CGSizeMake(weakSelf.circleView.frame.size.width * 16 / 19, weakSelf.circleView.frame.size.width * 16 / 19));
    }];
    [self.portraitImageView layoutIfNeeded];
    self.portraitImageView.layer.cornerRadius = self.portraitImageView.frame.size.width / 2;
    
//    添加竖线
    
    HDTwoLinesView *linesView = [[HDTwoLinesView alloc] init];
    linesView.backgroundColor = [UIColor whiteColor];
    [self.baseVIew addSubview:linesView];
    [linesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.baseVIew.mas_top).offset(weakSelf.baseVIew.frame.size.height * 5 / 12);
        make.left.equalTo(weakSelf.baseVIew);
        make.size.mas_equalTo(CGSizeMake(weakSelf.baseVIew.frame.size.width, weakSelf.baseVIew.frame.size.height *2 / 7 + 5));
    }];
    [linesView layoutIfNeeded];
    
//    设定三个固有的label
    
    UILabel *firstLabel = [[UILabel alloc] init];
    UILabel *secondLabel = [[UILabel alloc] init];
    UILabel *thirdLabel = [[UILabel alloc] init];
    
//    UIFont *font = [UIFont fontWithName:<#(nonnull NSString *)#> size:<#(CGFloat)#>]
//    firstLabel.font = font;
//    secondLabel.font = font;
//    thirdLabel.font = font;
    
    UIColor *color = [UIColor colorWithRed:73.0/255 green:73.0/255 blue:73.0/255 alpha:1];
    firstLabel.textColor = color;
    secondLabel.textColor = color;
    thirdLabel.textColor = color;
    
    firstLabel.text = @"翘课次数";
    secondLabel.text = @"拥有菌数";
    thirdLabel.text = @"作业情况";
    
    firstLabel.textAlignment = NSTextAlignmentCenter;
    secondLabel.textAlignment = NSTextAlignmentCenter;
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.baseVIew addSubview:firstLabel];
    [self.baseVIew addSubview:secondLabel];
    [self.baseVIew addSubview:thirdLabel];
    
    [secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.baseVIew.mas_left).offset(weakSelf.baseVIew.frame.size.width * 24 / 77);
        make.top.equalTo(weakSelf.baseVIew.mas_top).offset(weakSelf.baseVIew.frame.size.height * 5 / 12);
        make.size.mas_equalTo(CGSizeMake(weakSelf.baseVIew.frame.size.width *29 /77, weakSelf.baseVIew.frame.size.height / 7));
    }];
    [firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(weakSelf.baseVIew.frame.size.width *24 / 77, weakSelf.baseVIew.frame.size.height / 7));
        make.top.equalTo(secondLabel.mas_top);
        make.right.equalTo(secondLabel.mas_left);
    }];
    [thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secondLabel.mas_right);
        make.top.equalTo(secondLabel.mas_top);
        make.size.equalTo(firstLabel);
    }];
    
//    设定四个数据内容label
    UILabel *timesLabel = [[UILabel alloc] init];
    UILabel *gradesLabel = [[UILabel alloc] init];
    UILabel *evaluateLabel = [[UILabel alloc] init];
    
    //    UIFont *secondFont = [UIFont fontWithName:<#(nonnull NSString *)#> size:<#(CGFloat)#>]
//        timesLabel.font = secondFont;
//        gradesLabel.font = secondFont;
//        evaluateLabel.font = secondFont;
    
    timesLabel.textColor = [UIColor colorWithRed:252.0/255 green:130.0/255 blue:127.0/255 alpha:1];
    gradesLabel.textColor = [UIColor colorWithRed:84.0/255 green:209.0/255 blue:230.0/255 alpha:1];
    evaluateLabel.textColor = [UIColor colorWithRed:1 green:201.0/255 blue:91.0/255 alpha:1];
    
    timesLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.times];
    gradesLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.grades];
    evaluateLabel.text = self.evaluate;
    
    timesLabel.textAlignment = NSTextAlignmentCenter;
    gradesLabel.textAlignment = NSTextAlignmentCenter;
    evaluateLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.baseVIew addSubview:timesLabel];
    [self.baseVIew addSubview:gradesLabel];
    [self.baseVIew addSubview:evaluateLabel];
    
    [timesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(firstLabel);
        make.top.equalTo(firstLabel.mas_bottom).offset(5);
        make.left.equalTo(firstLabel.mas_left);
    }];
    [gradesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(secondLabel);
        make.top.equalTo(timesLabel.mas_top);
        make.left.equalTo(timesLabel.mas_right);
    }];
    [evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(thirdLabel);
        make.left.equalTo(thirdLabel.mas_left);
        make.top.equalTo(thirdLabel.mas_bottom).offset(5);
    }];
    
//    左下角的文字
    
    UILabel *detailLabel = [[UILabel alloc] init];
//    detailLabel.font = [UIFont fontWithName:<#(nonnull NSString *)#> size:<#(CGFloat)#>]
    detailLabel.textColor = [UIColor colorWithRed:106.0/255 green:106.0/255 blue:106.0/255 alpha:1];
    detailLabel.text = @"礼品清单";
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(11);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-4);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    UIImageView *mushroomView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"蘑菇"]];
    [self.baseVIew addSubview:mushroomView];
    [mushroomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(gradesLabel.mas_bottom);
        make.left.equalTo(gradesLabel.mas_left).offset(13);
        make.size.mas_equalTo(CGSizeMake(17, 19));
    }];
    
}

@end
