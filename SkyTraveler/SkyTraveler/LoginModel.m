//
//  LoginModel.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
{
    void (^resultBlock)(BOOL, NSString *);
    NetworkManager *networkManager;
    ShareUserInfo *shareUserInfo;
}

- (instancetype)initLoginModelWithResultBlock: (void(^)(BOOL, NSString *))rb {
    if (self = [super init]) {
        resultBlock = rb;
        networkManager = [NetworkManager networkManager];
        shareUserInfo = [ShareUserInfo shareUserInfo];
    }
    return self;
}

- (void)loginWithUserName: (NSString *)usn withPassword: (NSString *)psw {
    NSDictionary *dictionary = @{
                                 @"Name" : usn,
                                 @"Password" : psw,
                                 @"action" : @"signup"
                                 };
    [networkManager connectServerWithPathString:@"" JSONDictionary:dictionary returnDataWithBlock:^(NSData *d) {
        [self networkManagerReturnData:d];
    }];
}

- (void)networkManagerReturnData:(NSData *)data {
    NSLog(@"success123123");
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if ((int)jsonDictionary[@"Result"] == 19) {
        [shareUserInfo setUserId:[NSNumber numberWithInt:(int)jsonDictionary[@"User_Id"]]];
        resultBlock(YES ,@"");
    } else {
        resultBlock(NO, jsonDictionary[@"Result_Info"]);
    }
}


@end
