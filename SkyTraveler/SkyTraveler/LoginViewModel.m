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
    void (^loginningBlock)(void);
    void (^failResultBlock)(NSString *);
    void (^successBlock)(void);
}

- (instancetype)initWithLoginningBlock:(void (^)(void))lgb failResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb{
    if (self = [super init]) {
        loginningBlock = lgb;
        failResultBlock = frb;
        successBlock = sb;
    }
    return self;
}

- (void)loginWithUserName: (NSString *)usn withPassword: (NSString *)psw {
    
}

@end
