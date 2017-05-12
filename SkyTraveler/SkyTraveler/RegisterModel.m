//
//  RegisterModel.m
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "RegisterModel.h"

@implementation RegisterModel
{
    void (^resultBlock)(BOOL, NSString *);
    NetworkManager *networkManager;
}

- (instancetype)initRegisterModelWithResultBlock: (void(^)(BOOL, NSString *))rb {
    if (self = [super init]) {
        resultBlock = rb;
        networkManager = [NetworkManager networkManager];
    }
    return self;
}

- (void)registerWithUserName: (NSString *)usn withPassword: (NSString *)psw {
    NSDictionary *dictionary = @{
                                 @"Name" : usn,
                                 @"Password" : psw,
                                 @"action" : @"login"
                                 };
    [networkManager connectServerWithPathString:@"" JSONDictionary:dictionary returnDataWithBlock:^(NSData *d) {
        [self networkManagerReturnData:d];
    }];
}

- (void)networkManagerReturnData:(NSData *)data {
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if ((int)jsonDictionary[@"Result"] == 19) {
        resultBlock(YES, @"");
    } else {
        resultBlock(NO, jsonDictionary[@"Result_Info"]);
        NSLog(@"networkReturnData");
    }
}

@end
