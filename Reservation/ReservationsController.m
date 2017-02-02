//
//  ReservationsController.m
//  Reservation
//
//  Created by Shiva Sai Rudra on 31/01/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import "ReservationsController.h"
#import "ReservationCell.h"

@interface ReservationsController ()

@end

@implementation ReservationsController

NSMutableArray *arrData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSMutableArray *arr = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyReservations"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"ServiceName"] = @"Gel Manuicure";
    dict[@"Date"] = @"Monday, March 26, 2016";
    dict[@"Time"] = @"2:00 PM";
    dict[@"PartySize"] = @"4";
    dict[@"Duration"] = @"30M";
    dict[@"Description"] = @"Get the upper hand with our chip-resistant, mirror-finish get polish that requires no drying time and last up to two weeks.";
    
    arrData = [NSMutableArray array];
    
    /*NSMutableArray *archiveArray = [NSMutableArray arrayWithCapacity:mutableDataArray.count];
    for (BC_Person *personObject in mutableDataArray) {
        NSData *personEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:personObject];
        [archiveArray addObject:personEncodedObject];
    }*/
    
    [arrData addObject:dict];
    
    [[NSUserDefaults standardUserDefaults] setObject:arrData forKey:@"MyReservations"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    arrData = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyReservations"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return arrData.count;    //count number of row from counting array hear cataGorry is An Array
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 240;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *MyIdentifier = @"MyIdentifier";
    
    ReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[ReservationCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    NSDictionary *dict = arrData[0];
    
    cell.lblDate.text = dict[@"Date"];
    cell.lblTime.text = dict[@"Time"];
    cell.lblServiceName.text = dict[@"ServiceName"];
    cell.lblPartySize.text = dict[@"PartySize"];
    cell.lblDuration.text = dict[@"Duration"];
    cell.lblDescription.text = dict[@"Description"];
    
    return cell;
}


@end
