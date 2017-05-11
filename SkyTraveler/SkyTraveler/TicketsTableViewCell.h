//
//  TicketsTableViewCell.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrveTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivePlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatRemain;
@property (weak, nonatomic) IBOutlet UILabel *seatType;

@end
