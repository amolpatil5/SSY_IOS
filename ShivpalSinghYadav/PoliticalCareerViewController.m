//
//  PoliticalCareerViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "PoliticalCareerViewController.h"
#import "Constants.h"
#import "LocalizationConstant.h"
#import "BioDataTableViewCell.h"


@interface PoliticalCareerViewController ()

@end

@implementation PoliticalCareerViewController
static NSString *CellIdentifier = @"Bio_Cell";

@synthesize scrollview;
@synthesize politicalCareerDescLbl;
@synthesize politicalCareerHaderLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:POLITICAL_CAREER];
  
    
    [self.mainTableView setDelegate:self];
    [self.mainTableView setDataSource:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
 BioDataTableViewCell *tCell = [self configureCellForIndexPath:indexPath];
    return tCell;
}


#pragma mark - Cell configuration methods

-(BioDataTableViewCell*)configureCellForIndexPath:(NSIndexPath*)indexPath
{
    BioDataTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"BioDataTableViewCell" owner:self options:nil];
        cell = (BioDataTableViewCell*)[arr objectAtIndex:0];
    }
    [self assignDataToCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)assignDataToCell:(BioDataTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            [cell.titleLbl setText:POLITICAL_CAREER];
            [cell.descLbl setText:POLITICAL_CAREER_INFO];
            
        }
            break;
            
        default:
            break;
    }
    
}

-(CGFloat)heightForCellAtIndexPath:(NSIndexPath*)indexPath
{
    static BioDataTableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.mainTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (sizingCell == nil) {
            NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"BioDataTableViewCell" owner:self options:nil];
            sizingCell = (BioDataTableViewCell*)[arr objectAtIndex:0];
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
