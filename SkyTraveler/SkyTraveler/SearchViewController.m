//
//  SearchViewController.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet WithLineTextField *takingOffPlaceTextField;
@property (weak, nonatomic) IBOutlet WithLineTextField *landingPlaceTextField;
@property (weak, nonatomic) IBOutlet WithLineTextField *dateTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)touchUpInsideDateTextField:(WithLineTextField *)sender {
    UIAlertController *datePickerController = [UIAlertController alertControllerWithTitle:@"选择出发时间" message:@"\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *str = [dateFormat stringFromDate:datePicker.date];
        _dateTextField.text = str;
        [datePickerController dismissViewControllerAnimated:true completion:nil];
    }];
    [datePickerController.view addSubview:datePicker];
    [datePickerController addAction:ok];
    [self presentViewController:datePickerController animated:YES completion:nil];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
