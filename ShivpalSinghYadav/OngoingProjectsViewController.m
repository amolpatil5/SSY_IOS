//
//  OngoingProjectsViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 12/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "OngoingProjectsViewController.h"
#import "LocalizationConstant.h"
#import "Constants.h"
#import "EventsDatamodel.h"
#import "EventCellTableViewCell.h"
#import "OngoingProjectsDetailsViewController.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 300.0f
#define CELL_CONTENT_MARGIN 45.0f
static NSString *CellIdentifier = @"Event_Cell";

@interface OngoingProjectsViewController ()

@end

@implementation OngoingProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:ONGOING_PROJECTS];
    self.eventsDataArray = [[NSMutableArray alloc]init];
    
    //Following code needs to be uncommented for serviceCall to get Project Details online
    //For Now hardcoding data for projects
 /*
    NSURL *restURL = [NSURL URLWithString:GET_EVENTS_DATA_URL];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnData = nil;
    }
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    [self.spinner startAnimating];
    // If the connection was successful, create the XML that will be returned.
    self.apiReturnData = [NSMutableData data]; */
    
    
    
    [self.spinner stopAnimating];
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc]init];
     [eventDict setValue:@"saryu_1" forKey:@"image_name"];
     [eventDict setValue:title_Sarayu_canal_project forKey:@"title"];
     [eventDict setValue:Short_Description_Sarayu_canal_project forKey:@"desc"];
     [eventDict setValue:Long_Description_Sarayu_canal_project forKey:@"details"];
    
    EventsDatamodel *event1 = [[EventsDatamodel alloc]initWithDict:eventDict];
    [self.eventsDataArray addObject:event1];
    
    [eventDict setValue:@"badsagar_1" forKey:@"image_name"];
    [eventDict setValue:title_Bansagar_canal_project forKey:@"title"];
    [eventDict setValue:Short_Description_Bansagar_canal_project forKey:@"desc"];
    [eventDict setValue:Long_Description_Bansagar_canal_project forKey:@"details"];
    
    EventsDatamodel *event2 = [[EventsDatamodel alloc]initWithDict:eventDict];
    [self.eventsDataArray addObject:event2];

    
    [eventDict setValue:@"bundelkhand_1" forKey:@"image_name"];
    [eventDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
    [eventDict setValue:Short_Description_Bundelkhand_Irrigation_project forKey:@"desc"];
    [eventDict setValue:Long_Description_Bundelkhand_Irrigation_project forKey:@"details"];
    
    EventsDatamodel *event3 = [[EventsDatamodel alloc]initWithDict:eventDict];
    [self.eventsDataArray addObject:event3];
    
    
    if([self.eventsDataArray count]>0)
    {
        [self.mainTableView setHidden:NO];
        [self.mainTableView reloadData];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    [self.apiReturnData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    [self.apiReturnData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
    //NSLog(@"URL Connection Failed!");
    currentConnection = nil;
    [self.spinner stopAnimating];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    currentConnection = nil;
    [self.spinner stopAnimating];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:self.apiReturnData options:kNilOptions error:&error];
    
    if (error != nil) {
        //NSLog(@"Error parsing JSON.");
    }
    else
    {
        [self.eventsDataArray removeAllObjects];
        NSArray *eventsArray = [jsonDict valueForKey:@"events"];
        for (NSDictionary *dict in eventsArray)
        {
            EventsDatamodel *event = [[EventsDatamodel alloc]initWithDict:dict];
            [self.eventsDataArray addObject:event];
        }
        if([self.eventsDataArray count]>0)
        {
            [self.mainTableView setHidden:NO];
            [self.mainTableView reloadData];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventsDataArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [self heightForCellAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForCellAtIndexPath:indexPath];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EventCellTableViewCell *tCell = [self configureCellForIndexPath:indexPath];
    return tCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     EventsDatamodel *event = [self.eventsDataArray objectAtIndex:indexPath.row];
    OngoingProjectsDetailsViewController *objOngoingProjectsDetailsViewController = [[OngoingProjectsDetailsViewController alloc]init];
    objOngoingProjectsDetailsViewController.projTitle = event.title;
    objOngoingProjectsDetailsViewController.projDesc = [NSString stringWithFormat:@"%@ \n %@",event.desc,event.details];
    
    
    
    
    [self.navigationController pushViewController:objOngoingProjectsDetailsViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Cell configuration methods

-(EventCellTableViewCell*)configureCellForIndexPath:(NSIndexPath*)indexPath
{
    EventCellTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"EventCellTableViewCell" owner:self options:nil];
        cell = (EventCellTableViewCell*)[arr objectAtIndex:0];
    }
    [self assignDataToCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)assignDataToCell:(EventCellTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    EventsDatamodel *event = [self.eventsDataArray objectAtIndex:indexPath.row];
    [cell configureCellWithData:event];
}

-(CGFloat)heightForCellAtIndexPath:(NSIndexPath*)indexPath
{
    static EventCellTableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.mainTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (sizingCell == nil) {
            NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"EventCellTableViewCell" owner:self options:nil];
            sizingCell = (EventCellTableViewCell*)[arr objectAtIndex:0];
        }
    });
    
    [self assignDataToCell:sizingCell atIndexPath:indexPath];
    return [self heightForConfiguredCell:sizingCell];
}

-(CGFloat)heightForConfiguredCell:(UITableViewCell*)sizingCell
{
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.mainTableView.frame), CGRectGetHeight(sizingCell.bounds));
    
    [sizingCell setNeedsDisplay];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height+1.0f;
}



@end
