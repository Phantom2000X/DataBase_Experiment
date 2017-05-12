//
//  OrderedTicketModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "OrderedTicketModel.h"

@implementation OrderedTicketModel
{
    void (^ticketsFinishLoadBlock)(NSArray *);
    void (^finishedUnsubscribeTicketBlock)(NSDictionary *);
    void (^unsubscribeFailBlock)(void);
}
- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(NSArray *))tflb
                finishedUnsubscribeTicketBlock:(void (^)(NSDictionary *))futb
                          unsubscribeFailBlock:(void (^)(void))ufb {
    if (self = [super init]) {
        ticketsFinishLoadBlock = tflb;
        finishedUnsubscribeTicketBlock = futb;
        unsubscribeFailBlock = ufb;
    }
    return self;
}

- (void)unsubscribeTicketWithFlightId: (NSNumber *)fid
                               seatId:(NSNumber *)sid {
    
}

- (void)networkManagerReturnData:(NSData *)data {
    
}

@end
