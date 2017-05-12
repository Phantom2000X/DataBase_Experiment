//
//  OrderedTicketViewModel.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderedTicketCellData.h"
#import "OrderedTicketModel.h"

@interface OrderedTicketViewModel : NSObject

@property (nonatomic ,strong) NSMutableArray<OrderedTicketCellData *> *orderedTicketCellDatas;

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(void))tflb
                finishedUnsubscribeTicketBlock:(void (^)(void))futb
                          unsubscribeFailBlock:(void (^)(void))ufb;


@end
