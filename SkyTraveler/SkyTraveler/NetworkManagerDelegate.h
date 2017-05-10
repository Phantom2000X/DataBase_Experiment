//
//  NetworkManagerDelegate.h
//  ShowPay
//
//  Created by PhantomX on 2017/3/16.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@protocol NetworkManagerDelegate <NSObject>

- (void)networkManagerReturnData:(NSData *)data;

@end
