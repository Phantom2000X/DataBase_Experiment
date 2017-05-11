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
}

- (instancetype)initRegisterModelWithResultBlock: (void(^)(BOOL, NSString *))rb {
    if (self = [super init]) {
        resultBlock = rb;
    }
    return self;
}

- (void)registerWithUserName: (NSString *)usn withPassword: (NSString *)psw {
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
