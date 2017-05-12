//
//  TicketsModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "TicketsModel.h"

@implementation TicketsModel
{
    void (^ticketsFinishLoadBlock)(NSArray *);
    void (^finishedBuyTicketBlock)(NSDictionary *);
    void (^orderFailBlock)(void);
}

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(NSArray *))tflb finishedBuyTicketBlock:(void (^)(NSDictionary *))fbtb orderFailBlock:(void (^)(void))ofb {
    if (self = [super init]) {
        ticketsFinishLoadBlock = tflb;
        finishedBuyTicketBlock = fbtb;
        orderFailBlock = ofb;
    }
    return self;
}

- (void)searchForTicketsWithDepartTime:(NSString *)dpt departPlace:(NSString *)dpp arrivePlace:(NSString *)arvp {
    NSDictionary *dic = @{
                          @"Depart_Time" :dpt,
                          @"Depart_Place":dpp,
                          @"Arrive_Place":arvp
                          };
    //[NetworkManager connectServerWithPathString:<#(NSString *)#> JSONDictionary:dic];
}

- (void)orderTicketWithFlightId:(NSNumber *)fid seatId:(NSNumber *)sid {
    
}

- (void)networkManagerReturnData:(NSData *)data {
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
}

@end
