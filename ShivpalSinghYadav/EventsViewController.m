//
//  EventsViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "EventsViewController.h"
#import "Constants.h"
#import "EventsDatamodel.h"
#import "EventCellTableViewCell.h"
#import "EventDetailViewController.h"
#import "LocalizationConstant.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 300.0f
#define CELL_CONTENT_MARGIN 45.0f
static NSString *CellIdentifier = @"Event_Cell";

@interface EventsViewController ()

@end

@implementation EventsViewController
@synthesize eventsDataArray;
@synthesize spinner;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:EVENTS];
    
    self.eventsDataArray = [[NSMutableArray alloc]init];
    
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
    self.apiReturnData = [NSMutableData data];
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
            [self.mainTableview setHidden:NO];
            [self.mainTableview reloadData];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    //    if([event.deptURL length] >1)
    //    {
    EventDetailViewController *eventDetailVC = [[EventDetailViewController alloc]init];
    eventDetailVC.eventdataModel = event;
    [self.navigationController pushViewController:eventDetailVC animated:YES];
    
    //  }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Cell configuration methods

-(EventCellTableViewCell*)configureCellForIndexPath:(NSIndexPath*)indexPath
{
    EventCellTableViewCell *cell = [self.mainTableview dequeueReusableCellWithIdentifier:CellIdentifier];
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
        sizingCell = [self.mainTableview dequeueReusableCellWithIdentifier:CellIdentifier];
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
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.mainTableview.frame), CGRectGetHeight(sizingCell.bounds));
    
    [sizingCell setNeedsDisplay];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height+1.0f;
}

@end
