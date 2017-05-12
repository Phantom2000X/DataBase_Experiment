//
//  LoginViewModel.h
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface LoginViewModel : NSObject

- (instancetype)initWithFailResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb;
- (void)loginWithUserName:(NSString *)usn withPassword:(NSString *)psw;

@end
