//
//  DepartmentsViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "DepartmentsViewController.h"
#import "DepartmentsDataModel.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "WebViewViewController.h"
#import "LocalizationConstant.h"

@interface DepartmentsViewController ()

@end

@implementation DepartmentsViewController
@synthesize deptDataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:DEPARTMENTS];
    [self populateDepartmentsData];
    [self.mainTableView setDelegate:self];
        [self.mainTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.deptDataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CELL_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:cellId]
                ;
    }
    DepartmentsDataModel *dept = [self.deptDataArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:dept.deptName];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setNumberOfLines:0];
    cell.backgroundColor = [UIColor colorwithHexString:dept.deptColor alpha:1.0];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     DepartmentsDataModel *dept = [self.deptDataArray objectAtIndex:indexPath.row];
    
    if([dept.deptURL length] >1)
    {
    WebViewViewController *webVC = [[WebViewViewController alloc]init];
    webVC.strUrl = dept.deptURL;
    webVC.strTitle = dept.deptName;
    [self.navigationController pushViewController:webVC animated:YES];
    
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)populateDepartmentsData
{
   
    NSDictionary *dict1  = [NSDictionary dictionaryWithObjectsAndKeys:Public_Works_Department,KEY_DEPT_NAME,@"http://uppwd.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
    
    NSDictionary *dict2  = [NSDictionary dictionaryWithObjectsAndKeys:Irrigation,KEY_DEPT_NAME,@"http://irrigation.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
   
    NSDictionary *dict3  = [NSDictionary dictionaryWithObjectsAndKeys:Co_operative,KEY_DEPT_NAME,@"http://cooperative.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
   
    NSDictionary *dict4  = [NSDictionary dictionaryWithObjectsAndKeys:Land_Development_Water_Resources,KEY_DEPT_NAME,@"http://upldwr.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
    NSDictionary *dict5  = [NSDictionary dictionaryWithObjectsAndKeys:Flood_Control,KEY_DEPT_NAME,@"http://irrigation.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
    NSDictionary *dict6  = [NSDictionary dictionaryWithObjectsAndKeys:Irrigation_Mechanical,KEY_DEPT_NAME,@"http://irrigation.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
    NSDictionary *dict7  = [NSDictionary dictionaryWithObjectsAndKeys:Revenue,KEY_DEPT_NAME,@"http://revenue.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
   
    NSDictionary *dict8  = [NSDictionary dictionaryWithObjectsAndKeys:Uttar_Pradesh_Cooperative_Federation_Limited,KEY_DEPT_NAME,@"http://uppcf.org/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
    
    NSDictionary *dict9  = [NSDictionary dictionaryWithObjectsAndKeys:Sodic_Ravine_Land_development,KEY_DEPT_NAME,@"http://upldwr.up.nic.in/", KEY_DEPT_URL , @"#4a90e2" ,KEY_DEPT_COLOR, nil];
   
    NSDictionary *dict10  = [NSDictionary dictionaryWithObjectsAndKeys:Waste_Land_Development,KEY_DEPT_NAME,@"", KEY_DEPT_URL , @"#ffffff" ,KEY_DEPT_COLOR, nil];
    NSDictionary *dict11  = [NSDictionary dictionaryWithObjectsAndKeys:Disaster_Rehabilitation,KEY_DEPT_NAME,@"", KEY_DEPT_URL , @"#ffffff" ,KEY_DEPT_COLOR, nil];
    
    NSDictionary *dict12  = [NSDictionary dictionaryWithObjectsAndKeys:Public_Service_Management,KEY_DEPT_NAME,@"", KEY_DEPT_URL , @"#ffffff" ,KEY_DEPT_COLOR, nil];
    
    
    
    DepartmentsDataModel *dep1 = [[DepartmentsDataModel alloc]initWithDict:dict1];
    DepartmentsDataModel *dep2 = [[DepartmentsDataModel alloc]initWithDict:dict2];
    DepartmentsDataModel *dep3 = [[DepartmentsDataModel alloc]initWithDict:dict3];
    DepartmentsDataModel *dep4 = [[DepartmentsDataModel alloc]initWithDict:dict4];
    DepartmentsDataModel *dep5 = [[DepartmentsDataModel alloc]initWithDict:dict5];
    DepartmentsDataModel *dep6 = [[DepartmentsDataModel alloc]initWithDict:dict6];
    DepartmentsDataModel *dep7 = [[DepartmentsDataModel alloc]initWithDict:dict7];
    DepartmentsDataModel *dep8 = [[DepartmentsDataModel alloc]initWithDict:dict8];
    DepartmentsDataModel *dep9 = [[DepartmentsDataModel alloc]initWithDict:dict9];
    DepartmentsDataModel *dep10 = [[DepartmentsDataModel alloc]initWithDict:dict10];
    DepartmentsDataModel *dep11 = [[DepartmentsDataModel alloc]initWithDict:dict11];
    DepartmentsDataModel *dep12 = [[DepartmentsDataModel alloc]initWithDict:dict12];
    
    if(self.deptDataArray)
    {
        [self.deptDataArray removeAllObjects];
        self.deptDataArray = nil;
    }
    self.deptDataArray = [[NSMutableArray alloc]initWithObjects:dep1,dep2,dep3,dep4,dep5,dep6,dep7,dep8,dep9,dep10,dep11,dep12, nil];
    
}
@end
