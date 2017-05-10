//
//  LoginViewModel.h
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

- (instancetype)initWithLoginningBlock:(void (^)(void))lgb failResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb;

@end
