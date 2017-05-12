//
//  OrderedTicketModel.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface OrderedTicketModel : NSObject <NetworkManagerDelegate>

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(NSArray *))tflb
                        finishedUnsubscribeTicketBlock:(void (^)(NSDictionary *))futb
                                unsubscribeFailBlock:(void (^)(void))ufb;
- (void)unsubscribeTicketWithFlightId: (NSNumber *)fid
                         seatId:(NSNumber *)sid;

@end
