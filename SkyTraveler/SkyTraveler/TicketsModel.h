//
//  TicketsModel.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface TicketsModel : NSObject <NetworkManagerDelegate>

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(NSArray *))tflb
                        finishedBuyTicketBlock:(void (^)(NSDictionary *))fbtb
                                orderFailBlock:(void (^)(void))ofb;
- (void)searchForTicketsWithDepartTime:(NSString *)dpt
                           departPlace:(NSString *)dpp
                           arrivePlace:(NSString *)arvp;
- (void)orderTicketWithFlightId: (NSNumber *)fid
                         seatId:(NSNumber *)sid;

@end
