//
//  LoginViewController.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet WithLineTextField *userNameTextField;
@property (weak, nonatomic) IBOutlet WithLineTextField *passwordTextField;

@end

@implementation LoginViewController
{
    LoginViewModel *loginViewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_userNameTextField setDelegate:self];
    [_passwordTextField setDelegate:self];
    loginViewModel = [[LoginViewModel alloc] initWithFailResultBlock:^(NSString * rs) {
        [self loginFailWithReson:rs];
    } successBlock:^{
        [self performSegueWithIdentifier:@"LoginShow" sender:self];
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchView:(UIControl *)sender {
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)loginAlertViewShowUp: (NSString *)str {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NULL
                                                            message:str
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alertController presentingViewController];
}

- (IBAction)textFieldDoneEditing:(WithLineTextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)LoginButtonTouch:(UIButton *)sender {
    [ShowUpAlert showLoadingAlertControllerWithController:self];
    [loginViewModel loginWithUserName:_userNameTextField.text withPassword:_passwordTextField.text];
}

- (void)loginFailWithReson: (NSString *) rs{
    [ShowUpAlert showWarningResultAlertControllerWithString:rs withViewController:self];
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
