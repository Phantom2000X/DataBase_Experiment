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
@property (assign, nonatomic) CGSize originKBSieze;

@end

@implementation RegisterViewController
{
    RegisterViewModel *registerViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    registerViewModel = [[RegisterViewModel alloc] initWithFailResultBlock:^(NSString *str) {
        [ShowUpAlert showWarningResultAlertControllerWithString:str withViewController:self];
    } successBlock:^{
        NSLog(@"success");
        [[self presentedViewController] dismissViewControllerAnimated:true completion:^{
            [self.navigationController popViewControllerAnimated:true];
        }];
        
    }];
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    // Do any additional setup after loading the view.
}



- (IBAction)textFieldDoneEditing:(WithLineTextField *)sender {
    [sender resignFirstResponder];
}


#pragma mark - <UITextFieldDelegate>
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.tmpTextField = textField;
}

- (IBAction)touchView:(UIControl *)sender {
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.tmpTextField = nil;
}

- (IBAction)loginPress:(UIButton *)sender {
    [ShowUpAlert showLoadingAlertControllerWithController:self];
    [registerViewModel registerWithUserName:_userNameTextField.text withPassword:_passwordTextField.text withComfirmPassword:_confirmPasswordTextField.text];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
