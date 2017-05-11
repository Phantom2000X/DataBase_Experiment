//
//  TicketsTableViewController.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketsViewModel.h"

@interface TicketsTableViewController : UITableViewController

@property (nonatomic , strong) NSString *departTime;
@property (nonatomic , strong) NSString *departPlace;
@property (nonatomic , strong) NSString *arrivePlace;

@end
