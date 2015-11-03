//
//  ConstituencyViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "ConstituencyViewController.h"
#import "Constants.h"
#import "ConstituencyCellTableViewCell.h"
#import "LocalizationConstant.h"

@interface ConstituencyViewController ()

@end

@implementation ConstituencyViewController
@synthesize constituencydataArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:CONSTITUENCY];
    [self.headerLbl setText:Vidhan_Sabha_AREA];
    [self populateConstituencyArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [headerView setBackgroundColor:[UIColor blackColor]];
    
     UILabel *boothIndexLbl= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [boothIndexLbl setText:Vidhan_Sabha_Booth_Num];
    [boothIndexLbl setFont:[UIFont fontWithName:@"Helvectica" size:13.0f]];
    [boothIndexLbl setTextColor:[UIColor whiteColor]];
    [headerView addSubview:boothIndexLbl];

    UILabel *boothNameLbl= [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 100, 40)];
    [boothNameLbl setText:Vidhan_Sabha_Booth_Name];
    [boothNameLbl setTextColor:[UIColor whiteColor]];
    [boothNameLbl setFont:[UIFont fontWithName:@"Helvectica" size:13.0f]];
    [headerView addSubview:boothNameLbl];
    return headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.constituencydataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CELL_ID";
    ConstituencyCellTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"ConstituencyCellTableViewCell" owner:self options:nil];
        cell = (ConstituencyCellTableViewCell*)[arr objectAtIndex:0];
    }

    [cell.indexLbl setText:[NSString stringWithFormat:@"%d",(indexPath.row +1)]];
    [cell.nameLbl setText:[self.constituencydataArray objectAtIndex:indexPath.row]];
   return cell;
}

-(void)populateConstituencyArray
{
    NSString *path = [[HelperUtility getBundleForApp] pathForResource: @"constituencyList" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    self.constituencydataArray =(NSMutableArray *) [dict objectForKey: @"ConstituencyNames"];
}


@end
