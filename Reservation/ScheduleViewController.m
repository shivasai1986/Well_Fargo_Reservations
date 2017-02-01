//
//  ScheduleViewController.m
//  Reservation
//
//  Created by Shiva Sai Rudra on 01/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleDateCell.h"

@interface ScheduleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property(nonatomic, strong) NSMutableArray *datesThisMonth;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Get date and calender objects to calculate date parts and components
    NSDate *today = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    //Creating instance for _datesThisMonth array to bind thedates schedule cell.
    _datesThisMonth = [NSMutableArray array];
    NSRange rangeOfDaysThisMonth = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:today];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    //Getting Month, MonthName and Year using date formatter
    NSDateFormatter *monthFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *monthNameFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
    [yearFormatter setDateFormat: @"yyyy"];
    [monthFormatter setDateFormat: @"M"];
    [monthNameFormatter setDateFormat: @"MMMM"];
    NSInteger year = [[yearFormatter stringFromDate: today] integerValue];
    NSInteger month = [[monthFormatter stringFromDate: today] integerValue];
    
    [components setYear:year];
    [components setMonth:month];
    
    //Loop through the remaining months in this year and add them to dates array
    for (NSInteger i = rangeOfDaysThisMonth.location; i <= rangeOfDaysThisMonth.length; ++i) {
        [components setDay:i];
        NSDate *dayInMonth = [cal dateFromComponents:components];
        [_datesThisMonth addObject:dayInMonth];
    }
    
    //Setting lable to current month
    self.lblMonth.text =[[monthNameFormatter stringFromDate: today] uppercaseString];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data Source methods

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return [_datesThisMonth count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    NSString *MyIdentifier = @"scCell";
    ScheduleDateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MyIdentifier forIndexPath:indexPath];
    
    //Fetch date from dates array and set day and day of the week
    NSDate *date = _datesThisMonth[indexPath.row];
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat: @"d"];
    NSString *day = [dayFormatter stringFromDate: date];
    NSDateFormatter *weekdayFormatter = [[NSDateFormatter alloc] init];
    [weekdayFormatter setDateFormat: @"EEE"];
    NSString *weekday = [[weekdayFormatter stringFromDate: date] uppercaseString];
    
    cell.lblDay.text = day;
    cell.lblDayOfTheWeek.text = weekday;
    
    return cell;
    
}
@end
