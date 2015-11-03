//
//  PartyViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "PartyViewController.h"
#import "Constants.h"
#import "WebViewViewController.h"
#import "LocalizationConstant.h"
#import "BioDataTableViewCell.h"

@interface PartyViewController ()

@end

@implementation PartyViewController
static NSString *CellIdentifier = @"Bio_Cell";

@synthesize scrollView;
@synthesize containerView;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:SAMAJWADI_PARTY];
    
    [self.mainTableView setDataSource:self];
    [self.mainTableView setDelegate:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 1050.0)];
    UIButton *btn = [[UIButton alloc]initWithFrame:self.websiteLinkLbl.frame];
   
    [btn addTarget:self action:@selector(partyLinkBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:btn];
}

-(void)partyLinkBtnClicked
{
    WebViewViewController *webVC = [[WebViewViewController alloc]init];
    webVC.strUrl = self.websiteLinkLbl.text;
    webVC.strTitle = SAMAJWADI_PARTY;
 
    [self.navigationController pushViewController:webVC animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
            [cell.descLbl setText:PARTY_WEBSITE_URL];
            [cell.descLbl setTextColor:[UIColor blueColor]];
        }
            break;
            
        case 1:
        {
            [cell.titleLbl setText:ABOUT];
            [cell.descLbl setText:ABOUT_INFO];
        }
            break;
        case 2:
        {
            [cell.titleLbl setText:DESCRIPTION];
            [cell.descLbl setText:DESCRIPTION_INFO];
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
