//
//  RegisterViewController.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet WithLineTextField *userNameTextField;
@property (weak, nonatomic) IBOutlet WithLineTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet WithLineTextField *confirmPasswordTextField;

@property (strong, nonatomic) UITextField *tmpTextField;
@property (assign, nonatomic) CGSize kbSize;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册通知中心
    [self registerForKeyboardNotifications];
    // 设置代理
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)registerForKeyboardNotifications{
    // 键盘出现时的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    // 键盘隐藏时的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    // 视图消失时移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 键盘弹回
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

// 键盘弹起,视图上弹
- (void)keyboardWillShow:(NSNotification *)aNotification{
    NSDictionary *info = [aNotification userInfo];
    // kbSize键盘尺寸
    self.kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSLog(@"-----------------键盘弹起---------------");
    
    // 当前视图尺寸
    CGRect currentFrame = self.view.frame;
    CGFloat change = self.kbSize.height;
    currentFrame.origin.y = currentFrame.origin.y - change;
    
    // 弹起视图
    if (self.view.frame.origin.y >=0&&self.tmpTextField.frame.origin.y - change >0) {
        self.view.frame = currentFrame;
    }
}

// 键盘弹回，视图弹回
- (void)keyboardWillHide:(NSNotification *)aNotification{
    NSDictionary *info = [aNotification userInfo];
    // kbSize键盘尺寸
    self.kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSLog(@"键盘高度:%f",self.kbSize.height);
    
    // 当前视图尺寸
    CGRect currentFrame = self.view.frame;
    CGFloat change = self.kbSize.height;
    currentFrame.origin.y = currentFrame.origin.y + change;
    
    // 恢复视图
    if (self.view.frame.origin.y <0) {
        self.view.frame = currentFrame;
    }
}

- (IBAction)textFieldDoneEditing:(WithLineTextField *)sender {
    [sender resignFirstResponder];
}


#pragma mark - <UITextFieldDelegate>
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    NSLog(@"-----------------textFieldDidBeginEditing---------------");
    self.tmpTextField = textField;
}

- (IBAction)touchView:(UIControl *)sender {
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.tmpTextField = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
