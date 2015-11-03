//
//  BiographyViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "BiographyViewController.h"
#import "Constants.h"
#import "WebViewViewController.h"
#import "LocalizationConstant.h"
#import "BioDataTableViewCell.h"

@interface BiographyViewController ()

@end

@implementation BiographyViewController

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 300.0f
#define CELL_CONTENT_MARGIN 45.0f
static NSString *CellIdentifier = @"Bio_Cell";

@synthesize websiteHeaderLbl;
@synthesize websiteLinkLbl;
@synthesize biographyHeaderLbl;
@synthesize biographyDescLbl;
@synthesize earlyLifeHeaderLbl;
@synthesize earlyLifeDescLbl;
@synthesize eduQualHeaderLbl;
@synthesize eduQualDescLbl;
@synthesize familyStatusHeaderLbl;
@synthesize familyStatusDescLbl;
@synthesize scrollview;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mainTableView setDataSource:self];
    [self.mainTableView setDelegate:self];
    [self setTitle:BIOGRAPHY];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)partyLinkBtnClicked
{
    WebViewViewController *webVC = [[WebViewViewController alloc]init];
    webVC.strUrl = self.websiteLinkLbl.text;
    webVC.strTitle = BIOGRAPHY;
    [self.navigationController pushViewController:webVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0)
    {
        [self partyLinkBtnClicked];
    }
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
            [cell.titleLbl setText:WEBSITE_TITLE];
            [cell.descLbl setText:PERSONAL_WEBSITE_URL];
            [cell.descLbl setTextColor:[UIColor blueColor]];
        }
            break;
            
        case 1:
        {
          [cell.titleLbl setText:BIOGRAPHY];
           [cell.descLbl setText:BIOGRAPHY_INFO];
        }
            break;
        case 2:
        {
            [cell.titleLbl setText:EARLY_LIFE];
            [cell.descLbl setText:EARLY_LIFE_INFO];
        }
            break;
            
        case 3:
        {
            [cell.titleLbl setText:EDUCATIONAL_QUALIFICATION];
            [cell.descLbl setText:EDUCATIONAL_QUALIFICATION_INFO];
        }
            break;
        case 4:
        {
            [cell.titleLbl setText:FAMILY__STATUS];
            [cell.descLbl setText:FAMILY_STATUS_INFO];
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
    [sizingCell setNeedsDisplay];
    [sizingCell layoutIfNeeded];
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.mainTableView.frame), CGRectGetHeight(sizingCell.bounds));
    
  
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
}



@end
