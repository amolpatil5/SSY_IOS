//
//  EventDetailViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 11/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "EventDetailViewController.h"
#import "Constants.h"
#import "BioDataTableViewCell.h"
#import "LocalizationConstant.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

static NSString *CellIdentifier = @"Bio_Cell";
@synthesize eventImageView;

@synthesize eventdataModel;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.eventDescLbl.text = [self.eventdataModel details];
    //self.eventTitleLbl.text = [self.eventdataModel title];
    [self setTitle:EVENTS];

    [self.eventImageView setImageWithURL:[NSURL URLWithString:self.eventdataModel.image] placeholderImage:[UIImage imageNamed:@"head_banner"]];
    
    [self.mainTableView setDelegate:self];
    [self.mainTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
            [cell.titleLbl setBackgroundColor: [UIColor clearColor]];
            [cell.titleLbl setText:self.eventdataModel.title];
//            [cell.descLbl setText:self.eventdataModel.details];
             [cell.descLbl setText:[self convertHtmlPlainText:self.eventdataModel.details]];
        }
            break;
            
        default:
            break;
    }
    
    
}
-(NSString*)convertHtmlPlainText:(NSString*)HTMLString
{
    NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:HTMLData options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} documentAttributes:NULL error:NULL];
    NSString *plainString = attrString.string;
    return plainString;
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
