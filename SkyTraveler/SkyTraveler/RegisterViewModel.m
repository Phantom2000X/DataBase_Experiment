//
//  RegisterViewModel.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "RegisterViewModel.h"

@implementation RegisterViewModel
{
    void (^successBlock)(void);
    void (^failResultBlock)(NSString *);
    RegisterModel *registerModel;
}
- (instancetype)initWithFailResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb {
    if (self = [super init]) {
        failResultBlock = frb;
        successBlock = sb;
        registerModel = [[RegisterModel alloc] initRegisterModelWithResultBlock:^(BOOL isSuccess, NSString * result) {
            [self executeResuletWithIsSuccess:isSuccess withResult:result];
        }];
    }
    return self;
}
- (void)registerWithUserName: (NSString *)usn withPassword: (NSString *)psw withComfirmPassword: (NSString *)cpsw {
    if ([usn length] == 0 && [usn length] > 12 && [psw length] < 6 && [psw length] > 12)  {
        failResultBlock(@"用户名不能为空或大于12位，密码不能小于6位或大于12位");
        return;
    }
    if ([psw isEqualToString:cpsw]) {
        [registerModel registerWithUserName:usn withPassword:psw];
    }
    else {
        failResultBlock(@"两次输入的密码不一致");
        return;
    }
}


- (void)executeResuletWithIsSuccess: (BOOL) isc withResult: (NSString *)rs {
    if (isc) {
        successBlock();
    } else {
        failResultBlock(rs);
    }
}

@end
