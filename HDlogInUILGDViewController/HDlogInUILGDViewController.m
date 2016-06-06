//
//  ViewController.m
//  logInUI
//
//  Created by 李庚达 on 16/6/6.
//  Copyright © 2016年 李庚达. All rights reserved.
//

#import "HDlogInUILGDViewController.h"
#import "Masonry.h"

@interface HDlogInUILGDViewController ()

@end

@implementation HDlogInUILGDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *bgimageOfLogin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"注册bg"]];
    bgimageOfLogin.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bgimageOfLogin];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor orangeColor];
    [loginBtn setTitle:@"  加入作业！" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 20.0;
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginBtn addTarget:self
                 action:@selector(loginBtnTurnColorWithHeightlight:)
       forControlEvents:UIControlEventTouchDown];
    [loginBtn addTarget:self
                 action:@selector(loginBtnBackGroundColorNormal:)
       forControlEvents:UIControlEventTouchUpInside];
    [loginBtn addTarget:self
                 action:@selector(whenLoginBtnPressed:)
       forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginBtn];
    
    UITextField *mailAddressTF = [UITextField new];
    mailAddressTF.placeholder = @"邮箱";
    mailAddressTF.textColor = [UIColor blackColor];
    mailAddressTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    mailAddressTF.keyboardType = UIKeyboardTypeDefault;
    mailAddressTF.returnKeyType = UIReturnKeyDone;
    UIImageView *leftPicOfMailAddressTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    mailAddressTF.leftView = leftPicOfMailAddressTF;
    mailAddressTF.leftViewMode = UITextFieldViewModeAlways;
    mailAddressTF.borderStyle = UITextBorderStyleRoundedRect;
    mailAddressTF.layer.cornerRadius = 25.0;
    mailAddressTF.tag = 1;
    mailAddressTF.delegate = self;
    [self.view addSubview:mailAddressTF];
    
    UITextField *passwordTF = [UITextField new];
    passwordTF.placeholder = @"密码";
    passwordTF.textColor = [UIColor blackColor];
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTF.keyboardType = UIKeyboardTypeDefault;
    passwordTF.returnKeyType = UIReturnKeyDone;
    UIImageView *leftPicOfPasswordTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    passwordTF.leftView = leftPicOfPasswordTF;
    passwordTF.leftViewMode = UITextFieldViewModeAlways;
    passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    passwordTF.layer.cornerRadius = 25.0;
    passwordTF.tag = 2;
    passwordTF.delegate = self;
//    password.secureTextEntry = YES;
    [self.view addSubview:passwordTF];
    
    UITextField *schoolTF = [UITextField new];
    schoolTF.placeholder = @"院校";
    schoolTF.textColor = [UIColor blackColor];
    UIImageView *leftPicOfSchoolTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    UIImageView *rightPicOfSchoolTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    schoolTF.leftView = leftPicOfSchoolTF;
    schoolTF.leftViewMode = UITextFieldViewModeAlways;
    schoolTF.rightView = rightPicOfSchoolTF;
    schoolTF.rightViewMode = UITextFieldViewModeAlways;
    schoolTF.borderStyle = UITextBorderStyleRoundedRect;
    schoolTF.layer.cornerRadius = 25.0;
    schoolTF.tag = 3;
    schoolTF.delegate = self;
    [schoolTF addTarget:self
                 action:@selector(whenTextFieldPressed:)
       forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:schoolTF];
    
    UITextField *gradeAndCollegeTF = [UITextField new];
    gradeAndCollegeTF.placeholder = @"年级/院系";
    gradeAndCollegeTF.textColor = [UIColor blackColor];
    UIImageView *leftPicOfgradeAndCollegeTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    UIImageView *rightPicOfgradeAndCollegeTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    gradeAndCollegeTF.leftView = leftPicOfgradeAndCollegeTF;
    gradeAndCollegeTF.leftViewMode = UITextFieldViewModeAlways;
    gradeAndCollegeTF.rightView = rightPicOfgradeAndCollegeTF;
    gradeAndCollegeTF.rightViewMode = UITextFieldViewModeAlways;
    gradeAndCollegeTF.borderStyle = UITextBorderStyleRoundedRect;
    gradeAndCollegeTF.layer.cornerRadius = 25.0;
    gradeAndCollegeTF.tag = 4;
    gradeAndCollegeTF.delegate = self;
    [gradeAndCollegeTF addTarget:self
                          action:@selector(whenTextFieldPressed:)
                forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:gradeAndCollegeTF];
    
    UITextField *classAndTimeOfJoinInTF = [UITextField new];
    classAndTimeOfJoinInTF.placeholder = @"班级/入学时间";
    classAndTimeOfJoinInTF.textColor = [UIColor blackColor];
    UIImageView *leftPicOfclassAndTimeOfJoinInTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    UIImageView *rightPicOfclassAndTimeOfJoinInTF = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    classAndTimeOfJoinInTF.leftView = leftPicOfclassAndTimeOfJoinInTF;
    classAndTimeOfJoinInTF.leftViewMode = UITextFieldViewModeAlways;
    classAndTimeOfJoinInTF.rightView = rightPicOfclassAndTimeOfJoinInTF;
    classAndTimeOfJoinInTF.rightViewMode = UITextFieldViewModeAlways;
    classAndTimeOfJoinInTF.borderStyle = UITextBorderStyleRoundedRect;
    classAndTimeOfJoinInTF.layer.cornerRadius = 25.0;
    classAndTimeOfJoinInTF.tag = 5;
    classAndTimeOfJoinInTF.delegate = self;
    [classAndTimeOfJoinInTF addTarget:self
                               action:@selector(whenTextFieldPressed:)
                     forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:classAndTimeOfJoinInTF];
    
    [loginBtn makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@95);
        make.right.equalTo(self.view.right).offset(@-95);
//        make.top.equalTo(classAndTimeOfJoinInTF.bottom).offset(@0);
        make.bottom.equalTo(self.view.bottom).offset(@-75);
        make.height.equalTo(@40);
    }];
    
    [mailAddressTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@40);
        make.right.equalTo(self.view.right).offset(@-40);
//        make.top.equalTo().offset();
        make.bottom.equalTo(passwordTF.top).offset(@-30);
        make.height.equalTo(@45);
    }];
    
    [passwordTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@40);
        make.right.equalTo(self.view.right).offset(@-40);
        //        make.top.equalTo().offset();
        make.bottom.equalTo(schoolTF.top).offset(@-30);
        make.height.equalTo(@45);
    }];
    
    [schoolTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@40);
        make.right.equalTo(self.view.right).offset(@-40);
//        make.top.equalTo().offset();
        make.bottom.equalTo(gradeAndCollegeTF.top).offset(@-30);
        make.height.equalTo(@45);
    }];
    
    [gradeAndCollegeTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@40);
        make.right.equalTo(self.view.right).offset(@-40);
//        make.top.equalTo().offset();
        make.bottom.equalTo(classAndTimeOfJoinInTF.top).offset(@-30);
        make.height.equalTo(@45);
    }];
    
    [classAndTimeOfJoinInTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@40);
        make.right.equalTo(self.view.right).offset(@-40);
//        make.top.equalTo().offset();
        make.bottom.equalTo(loginBtn.top).offset(@-40);
        make.height.equalTo(@45);
    }];
    
}

/**
 *      监听textField的点击事件，获得一个反应
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //判断是否需要弹出键盘
    if (textField.tag == 1) {
        return YES;
    } else if (textField.tag == 2) {
        return YES;
    } else
        return NO;
}

//点击textField时的方法
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField.tag == 1) {
        
    } else if (textField.tag == 2) {
        
    } else if (textField.tag == 3) {
        
    } else if (textField.tag == 4) {
        
    } else if (textField.tag == 5) {
        
    }
    
}

//注册按钮点击事件
- (void)whenLoginBtnPressed:(UIButton *)button {
    
}

//loginBtn普通状态下的背景色
- (void)loginBtnBackGroundColorNormal:(UIButton *)button {
    
    button.backgroundColor = [UIColor orangeColor];
    
}

//loginBtn高亮状态下的背景色
- (void)loginBtnTurnColorWithHeightlight:(UIButton *)button {
    
    button.backgroundColor = [UIColor yellowColor];
    //高亮的颜色
    
}

/*
    表示
    学校选择、年纪选择、班级/入学时间选择
    的textField点击事件
*/
- (void)whenTextFieldPressed:(UITextView *)textField {
    if (textField.tag == 3) {
        
    } else if (textField.tag == 4) {
        
    } else if (textField.tag == 5) {
        
    }
}

//点击任意空白处键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}

//视图上移的方法
/*
 实现此方法需要<UITextFieldDelegate>协议
 并将代理设置为自己
 */
- (void) animateTextField: (UITextField *) textField up: (BOOL) up {
    const int movementDistance = 100;
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"Animation" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    //动画持续时间
    [UIView setAnimationDuration: 0.50];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
