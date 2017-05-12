//
//  LoginViewModel.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
{
    void (^failResultBlock)(NSString *);
    void (^successBlock)(void);
    LoginModel *loginModel;
}

- (instancetype)initWithFailResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb{
    if (self = [super init]) {
        failResultBlock = frb;
        successBlock = sb;
        loginModel = [[LoginModel alloc] initLoginModelWithResultBlock:^(BOOL isSuccess, NSString *rs) {
            [self executeResuletWithIsSuccess:isSuccess withResult:rs];
        }];
    }
    return self;
}

- (void)loginWithUserName:(NSString *)usn withPassword:(NSString *)psw {
    if ([usn length] == 0 || [usn length] > 12 || [psw length] < 6 || [psw length] > 12)  {
        failResultBlock(@"用户名不能为空或大于12位，密码不能小于6位或大于12位");
        return;
    }
    [loginModel loginWithUserName:usn withPassword:psw];
}


- (void)executeResuletWithIsSuccess: (BOOL) isc withResult: (NSString *)rs {
    if (isc) {
        successBlock();
    } else {
        failResultBlock(rs);
    }
}
                      
@end
