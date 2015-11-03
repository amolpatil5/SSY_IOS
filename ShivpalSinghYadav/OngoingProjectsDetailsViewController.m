//
//  OngoingProjectsDetailsViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 28/10/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "OngoingProjectsDetailsViewController.h"
#import "LocalizationConstant.h"
#import "Constants.h"
#import "BioDataTableViewCell.h"
#import "EventsDatamodel.h"
#import "ImageDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define TILE_IDENTIFIER @"TileCellID"
#define TILE_ICON_IMAGE_NAME @"TileIconImageName"
#define TILE_COLOR @"TileColor"
#define TILE_TITLE @"TileTitle"

static NSString *CellIdentifier = @"Bio_Cell";

@interface OngoingProjectsDetailsViewController ()

@end

@implementation OngoingProjectsDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mainTableView setDataSource:self];
    [self.mainTableView setDelegate:self];
    [self setTitle:ONGOING_PROJECTS];
    
    self.imageDataArray = [[NSMutableArray alloc]init];
    [self.maincollectionView registerNib:[UINib nibWithNibName:@"TileCell" bundle:nil]forCellWithReuseIdentifier:TILE_IDENTIFIER];
    
    [self.maincollectionView setDelegate:self];
    [self.maincollectionView setDataSource:self];
    
    // Configure layout
    //self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //[self.mainCollectionFlowLayout setItemSize:CGSizeMake(95, 95)];
    [self.mainCollectionLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mainCollectionLayout.minimumInteritemSpacing = 2.5f;
    self.mainCollectionLayout.minimumLineSpacing = 2.5f;
    [self.maincollectionView setCollectionViewLayout:self.mainCollectionLayout];
    
    self.maincollectionView.bounces = YES;
    [self.maincollectionView setShowsHorizontalScrollIndicator:NO];
    [self.maincollectionView setShowsVerticalScrollIndicator:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDelegate Methods

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0)
    {
//        [self partyLinkBtnClicked];
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
            [cell.titleLbl setText:self.projTitle];
            [cell.descLbl setText:self.projDesc];
        }
            break;
            
        case 1:
        {
            [cell.titleLbl setText:EARLY_LIFE];
            [cell.descLbl setText:EARLY_LIFE_INFO];
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




#pragma mark - UIcollectioView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
//    return [self.imageDataArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    EventsDatamodel *event = [self.imageDataArray objectAtIndex:indexPath.item];
    UICollectionViewCell *cell = [self.maincollectionView dequeueReusableCellWithReuseIdentifier:TILE_IDENTIFIER forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    
    [cell.contentView addSubview:imageView];
    [imageView setImage:[UIImage imageNamed:@"partylogo"]];
    
//    [imageView setImageWithURL:[NSURL URLWithString:event.image]
//              placeholderImage:[UIImage imageNamed:@"partylogo"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
//    EventsDatamodel *event = [self.imageDataArray objectAtIndex:indexPath.item];
//    if(event && [event.image length] >0)
//    {
//        ImageDetailsViewController *imgDetailsVC = [[ImageDetailsViewController alloc]init];
//        imgDetailsVC.imageURLString =event.image;
//        imgDetailsVC.imageDataArray = [self.imageDataArray mutableCopy];
//        imgDetailsVC.selectedIndex = (int)indexPath.item;
//        [self.navigationController pushViewController:imgDetailsVC animated:YES];
//    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cellWidth = ((self.maincollectionView.frame.size.width/3) - 2.5);
    return CGSizeMake(cellWidth , cellWidth);
}



@end
