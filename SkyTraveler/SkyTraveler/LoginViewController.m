//
//  LoginViewController.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking.h>
//#import <>

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
//    NSDictionary *dic = @{
//                          @"action" :@"Login",
//                          @"Username":@"asdf",
//                          @"Password":@"sadfsadf"
//                          };
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error: nil];
//    [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
//                                                  URLString:@"http://192.168.199.112:8080/Database_Experiment/MainServlet"
//                                                 parameters:dic
//                                                      error:nil];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    
//    NSDictionary *parameters = @{
//                                 @"action":@"login",
//                                 @"Name":@"asdf",
//                                 @"Password":@"asdfasdf"
//                                 };
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager POST:@"http://192.168.199.112:8080/Database_Experiment/MainServlet" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", str);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"asdf");
//    }];
//    
    [_userNameTextField setDelegate:self];
    [_passwordTextField setDelegate:self];
    loginViewModel = [[LoginViewModel alloc] initWithFailResultBlock:^(NSString * rs) {
        [self loginFailWithReson:rs];
    } successBlock:^{
        [[self presentedViewController] dismissViewControllerAnimated:true completion:^{
            [self performSegueWithIdentifier:@"LoginShow" sender:self];
        }];
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
    [loginViewModel loginWithUserName:_userNameTextField.text withPassword:_passwordTextField.text];
    [ShowUpAlert showLoadingAlertControllerWithController:self];
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
