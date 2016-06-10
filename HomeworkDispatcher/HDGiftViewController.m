//
//  HDGiftViewController.m
//  HomeworkDispatcher
//
//  Created by Apple on 16/6/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDGiftViewController.h"
#import "HDHeadProfileView.h"
#import <Masonry.h>

@implementation HDGiftViewController {
    HDHeadProfileView *_headVIew;
    UITableView *_list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    _headVIew = [[HDHeadProfileView alloc] init];
    [self.view addSubview:_headVIew];
    [_headVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(64);
        make.height.mas_equalTo(weakSelf.view.frame.size.height / 3);
    }];
    [_headVIew layoutIfNeeded];
    [_headVIew layOut];
    
    _list = [[UITableView alloc] init];
    _list.delegate = self;
    [self.view addSubview:_list];
    [_list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_headVIew.mas_bottom);
    }];
}

#pragma mark - UITableView

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {}

@end
