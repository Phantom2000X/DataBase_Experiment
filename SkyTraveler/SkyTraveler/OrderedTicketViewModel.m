//
//  OrderedTicketViewModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "OrderedTicketViewModel.h"

@implementation OrderedTicketViewModel
{
    void (^ticketsFinishLoadBlock)(void);
    void (^finishedUnsubscribeTicketBlock)(void);
    void (^unsubscribeFailBlock)(void);
    OrderedTicketModel *orderedTicketModel;
}

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(void))tflb
                finishedUnsubscribeTicketBlock:(void (^)(void))futb
                          unsubscribeFailBlock:(void (^)(void))ufb {
    if (self = [super init]) {
        ticketsFinishLoadBlock = tflb;
        finishedUnsubscribeTicketBlock = futb;
        unsubscribeFailBlock = ufb;
        orderedTicketModel = [[OrderedTicketModel alloc] initWithTicketsFinishLoadBlock:^(NSArray *ary) {
            
        }
                                                         finishedUnsubscribeTicketBlock:^(NSDictionary *dic) {
                                                             
                                                         }
                                                                   unsubscribeFailBlock:^{
                                                                       
                                                                   }];
    }
    return self;
}

- (void)loadTicketsData: (NSArray<NSDictionary *> *)ticketsData {
    for (NSDictionary *dic in ticketsData) {
        OrderedTicketCellData *cellData = [[OrderedTicketCellData alloc] init];
        //cellData.arrivePlace = arrivePlace;
        cellData.arriveTime = dic[@"Arrive_Time"];
        //cellData.departPlace = departPlace;
        cellData.departTime = dic[@"Depart_Time"];
        cellData.companyName = dic[@"Company_Name"];
        cellData.seatType = dic[@"Seat_Type"];
        cellData.seatNumber = dic[@"Seat_Number"];
        cellData.price = dic[@"price"];
        cellData.flightId = dic[@"Flight_Id"];
        //[_ticketsCellDatas addObject:cellData];
    }
}

@end
