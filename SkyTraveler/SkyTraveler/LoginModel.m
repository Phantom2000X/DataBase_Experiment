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
}

- (instancetype)initLoginModelWithResultBlock: (void(^)(BOOL, NSString *))rb {
    if (self = [super init]) {
        resultBlock = rb;
    }
    return self;
}

- (void)loginWithUserName: (NSString *)usn withPassword: (NSString *)psw {
    NSDictionary *dictionary = @{
                                 @"Name" : usn,
                                 @"Password" : psw
                                 };
    [NetworkManager connectServerWithPathString:@"" JSONDictionary: dictionary];
}

- (void)networkManagerReturnData:(NSData *)data {
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
}


@end
