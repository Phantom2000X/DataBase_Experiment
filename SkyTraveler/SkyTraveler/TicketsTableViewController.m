//
//  TicketsTableViewController.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "TicketsTableViewController.h"

@interface TicketsTableViewController ()

@end

@implementation TicketsTableViewController
{
    TicketsViewModel *ticketsViewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ticketsViewModel = [[TicketsViewModel alloc] initWithTicketsFinishLoadBlock:^{
        if ([self presentedViewController]) {
            [[self presentedViewController] dismissViewControllerAnimated:true completion:^{
                [self refreshData];
            }];
        } else {
            [self refreshData];
        }
    }
                                                         finishedBuyTicketBlock:^{
                                                              [self performSegueWithIdentifier:@"TicketShowComplete" sender:self];
                                                         }
                                                                 orderFailBlock:^{
                                                                     [ShowUpAlert showWarningResultAlertControllerWithString:@"订票失败"
                                                                                                          withViewController:self];
                                                                 }];
    [ShowUpAlert showLoadingAlertControllerWithController:self];
    [ticketsViewModel searchForTicketsWithDepartTime:_departTime departPlace:_departPlace arrivePlace:_arrivePlace];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ticketsViewModel.ticketsCellDatas.count;
}


- (void)refreshData {
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [ShowUpAlert showLoadingAlertControllerWithController:self];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定购买"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确认"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * _Nonnull action) {
                                                   [ticketsViewModel orderTicketWithIndexOfCell:indexPath];
                                               }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style: UIAlertActionStyleCancel
                                                   handler:nil];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:true completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TicketsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ticketTableViewCell" forIndexPath:indexPath];
    cell.departTimeLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].departTime;
    cell.departPlaceLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].departPlace;
    cell.arrveTimeLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].arriveTime;
    cell.arrivePlaceLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].arrivePlace;
    cell.companyNameLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].companyName;
    cell.priceLabel.text = [NSString stringWithFormat:(@"%ld"), (long)[ticketsViewModel.ticketsCellDatas[indexPath.row].price integerValue]];
    cell.seatRemain.text = [NSString stringWithFormat:(@"%ld"), (long)[ticketsViewModel.ticketsCellDatas[indexPath.row].seatRemain integerValue]];
    cell.seatType.text = ticketsViewModel.ticketsCellDatas[indexPath.row].seatType;
    // Configure the cell...
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CompleteViewController *cvc = [segue destinationViewController];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[ticketsViewModel.seletedIndex intValue] inSection:0];
    cvc.departTimeLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].departTime;
    cvc.departPlaceLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].departPlace;
    cvc.arriveTimeLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].arriveTime;
    cvc.arrivePlaceLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].arrivePlace;
    cvc.companyNameLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].companyName;
    cvc.priceLabel.text = [NSString stringWithFormat:(@"%ld"), (long)[ticketsViewModel.ticketsCellDatas[indexPath.row].price integerValue]];
    cvc.seatRemainLabel.text = [NSString stringWithFormat:(@"%ld"), (long)[ticketsViewModel.ticketsCellDatas[indexPath.row].seatRemain integerValue]];
    cvc.seatTypeLabel.text = ticketsViewModel.ticketsCellDatas[indexPath.row].seatType;
    cvc.pickupTimeLabel.text = ticketsViewModel.pickupTime;
    cvc.pickupPlaceLabel.text = ticketsViewModel.pickupPlace;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
