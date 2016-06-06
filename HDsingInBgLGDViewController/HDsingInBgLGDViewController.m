//
//  ViewController.m
//  界面
//
//  Created by 李庚达 on 16/6/4.
//  Copyright © 2016年 李庚达. All rights reserved.
//

#import "HDsingInBgLGDViewController.h"
#import "Masonry.h"

@interface HDsingInBgLGDViewController ()

@end

@implementation HDsingInBgLGDViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
#pragma mark 设置背景图片
    
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆bg"]];
    bgImage.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bgImage];
    
#pragma mark 设置登陆button
    
    UIButton *signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];//设置button样式为圆角
    //设置button背景颜色
    signInBtn.backgroundColor = [UIColor redColor];
    //设置button名称
    [signInBtn setTitle:@"  开始作业！" forState:UIControlStateNormal];
    //设置button名称的颜色
    [signInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button圆角的角度
    signInBtn.layer.cornerRadius = 20.0;
    //设置button文本的排列方式--居中
    signInBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:signInBtn];
    
#pragma mark 设置注册button
    
    UIButton *logInBtn = [UIButton new];
    //设置button名称
    [logInBtn setTitle:@"  注册一下？" forState:UIControlStateNormal];
    //设置button名称的颜色
    [logInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button文本的排列方式--居中
    logInBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    //设置button文本的字体大小（这里为14号）
    logInBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:logInBtn];
    
#pragma mark 设置输入账号的textFiled
    
    UITextField *signInFd = [UITextField new];
    //textFiled的预设置文本
    signInFd.placeholder = @"请输入账号";
    //textFiled的输入文本的字体颜色
    signInFd.textColor = [UIColor blackColor];
    //当编辑时显示叉号
    signInFd.clearButtonMode = UITextFieldViewModeWhileEditing;
    //设置键盘的样式--此处为默认
    #warning keyboardType
    /*
     设计师大大看这里，键盘的所有样式（你自己选个好看的）：
     typedef enum {
     UIKeyboardTypeDefault,        默认键盘，支持所有字符
     UIKeyboardTypeASCIICapable,   支持ASCII的默认键盘
     UIKeyboardTypeNumbersAndPunctuation,  标准电话键盘，支持＋＊＃字符
     UIKeyboardTypeURL,            URL键盘，支持.com按钮 只支持URL字符
     UIKeyboardTypeNumberPad,      数字键盘
     UIKeyboardTypePhonePad,       电话键盘
     UIKeyboardTypeNamePhonePad,   电话键盘，也支持输入人名
     UIKeyboardTypeEmailAddress,   用于输入电子 邮件地址的键盘
     UIKeyboardTypeDecimalPad,     数字键盘 有数字和小数点
     UIKeyboardTypeTwitter,        优化的键盘，方便输入@、#字符
     UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable,
     } UIKeyboardType;
     */
    signInFd.keyboardType = UIKeyboardTypeDefault;
    //更改return键的样式
    #warning returnKeyType
    /*
     设计师大大看这里，return的所有样式（你自己选个好看的）：
     typedef enum {
     UIReturnKeyDefault, 默认 灰色按钮，标有Return
     UIReturnKeyGo,      标有Go的蓝色按钮
     UIReturnKeyGoogle,标有Google的蓝色按钮，用语搜索
     UIReturnKeyJoin,标有Join的蓝色按钮
     UIReturnKeyNext,标有Next的蓝色按钮
     UIReturnKeyRoute,标有Route的蓝色按钮
     UIReturnKeySearch,标有Search的蓝色按钮
     UIReturnKeySend,标有Send的蓝色按钮
     UIReturnKeyYahoo,标有Yahoo的蓝色按钮
     UIReturnKeyYahoo,标有Yahoo的蓝色按钮
     UIReturnKeyEmergencyCall, 紧急呼叫按钮
     } UIReturnKeyType;
     */
    signInFd.returnKeyType = UIReturnKeyJoin;
    //设置输入框左边的图片
    #warning 缺少图片
    UIImageView *leftPic1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    signInFd.leftView = leftPic1;
    signInFd.leftViewMode = UITextFieldViewModeAlways;//图片显示形式：一直显示
    //设置输入框的样式：圆角
    signInFd.borderStyle = UITextBorderStyleRoundedRect;
    signInFd.layer.cornerRadius = 25.0;//设置圆角大小
    //tag ＝ 1
    signInFd.tag = 1;
    //设置协议代理为自己
    signInFd.delegate = self;
    [self.view addSubview:signInFd];
    
    #pragma mark 设置输入密码的textfiled
    
    UITextField *passwordFd = [UITextField new];
    //textFiled的预设置文本
    passwordFd.placeholder = @"请输入密码";
    //textFiled的输入文本的字体颜色
    passwordFd.textColor = [UIColor blackColor];
    //当编辑时显示叉号
    passwordFd.clearButtonMode = UITextFieldViewModeWhileEditing;
    //设置键盘的样式--此处为默认
    passwordFd.keyboardType = UIKeyboardTypeDefault;
    //更改return键的样式
    passwordFd.returnKeyType = UIReturnKeyGo;
    //讲输入内容转化为“*”显示
    passwordFd.secureTextEntry = YES;
    //设置输入框左边的图片
    #warning 缺少图片
    UIImageView *leftPic2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    passwordFd.leftView = leftPic2;
    passwordFd.leftViewMode = UITextFieldViewModeAlways;
    //设置输入框的样式：圆角
    passwordFd.borderStyle = UITextBorderStyleRoundedRect;
    passwordFd.layer.cornerRadius = 25.0;//设置圆角大小
    //tag = 2
    passwordFd.tag = 2;
    //设置协议代理为自己
    passwordFd.delegate = self;
    [self.view addSubview:passwordFd];
    
    
    //设置布局
    #warning 设置布局
    [signInFd makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@50);
        make.right.equalTo(self.view.right).offset(@-50);
        make.top.equalTo(self.view.top).offset(@220);
//        make.bottom.equalTo(passwordFd.top).offset(@-300);
        make.height.equalTo(@45);
    }];
    
    [passwordFd makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@50);
        make.right.equalTo(self.view.right).offset(@-50);
        make.top.equalTo(signInFd.bottom).offset(@30);
//        make.bottom.equalTo(self.view.bottom).offset(@-220);
        make.height.equalTo(@45);
    }];
    
    [signInBtn makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@100);
        make.right.equalTo(self.view.right).offset(@-100);
        make.top.equalTo(passwordFd.bottom).offset(@60);
//        make.bottom.equalTo(self.view.bottom).offset(@-130);
        make.height.equalTo(@35);
    }];
    
    [logInBtn makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.left).offset(@100);
        make.right.equalTo(self.view.right).offset(@-100);
        make.top.equalTo(signInBtn.bottom).offset(@42);
//        make.bottom.equalTo(self.view.bottom).offset(@-90);
        make.height.equalTo(@10);
    }];
    
}


//在UITextField 编辑之前调用方法
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animateTextField: textField up: YES];
}

//在UITextField 编辑完成调用方法
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animateTextField: textField up: NO];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
