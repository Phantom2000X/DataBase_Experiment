//
//  TicketsViewModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "TicketsViewModel.h"

@implementation TicketsViewModel
{
    void (^ticketsFinishLoadBlock)(void);
    void (^finishedBuyTicketBlock)(void);
}

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(void))tflb finishedBuyTicketBlock:(void (^)(void))fbtb {
    if (self = [super init]) {
        ticketsFinishLoadBlock = tflb;
        finishedBuyTicketBlock = fbtb;
    }
    return self;
}

- (void)searchForTicketsWithDepartTime:(NSString *)dpt departPlace:(NSString *)dpp arrivePlace:(NSString *)arvp {
    
}

@end
