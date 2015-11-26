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
#import "ImageItemModel.h"
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
    
    if([self.projTitle isEqualToString:title_Sarayu_canal_project])
    {
        NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
        [paramDict setValue:@"saryu_1" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item1 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item1];
        
        [paramDict setValue:@"saryu_2" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item2 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item2];
        
        [paramDict setValue:@"saryu_3" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item3 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item3];
        
        [paramDict setValue:@"saryu_4" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item4 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item4];
        
        [paramDict setValue:@"saryu_5" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item5 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item5];
        
        [paramDict setValue:@"saryu_6" forKey:@"image_name"];
        [paramDict setValue:title_Sarayu_canal_project forKey:@"title"];
        ImageItemModel *item6 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item6];
        
    }
    else if ([self.projTitle isEqualToString:title_Bansagar_canal_project])
    {
        NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
        [paramDict setValue:@"badsagar_1" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item1 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item1];
        
        [paramDict setValue:@"badsagar_2" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item2 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item2];
        
        [paramDict setValue:@"badsagar_3" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item3 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item3];
        
        [paramDict setValue:@"badsagar_4" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item4 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item4];
        
        [paramDict setValue:@"badsagar_5" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item5 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item5];
        
        [paramDict setValue:@"badsagar_6" forKey:@"image_name"];
        [paramDict setValue:title_Bansagar_canal_project forKey:@"title"];
        ImageItemModel *item6 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item6];
    }
    else if ([self.projTitle isEqualToString:title_Bundelkhand_Irrigation_project])
    {
        NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
        [paramDict setValue:@"bundelkhand_1" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item1 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item1];
        
        [paramDict setValue:@"bundelkhand_2" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item2 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item2];
        
        [paramDict setValue:@"bundelkhand_3" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item3 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item3];
        
        [paramDict setValue:@"bundelkhand_4" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item4 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item4];
        
        [paramDict setValue:@"bundelkhand_5" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item5 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item5];
        
        [paramDict setValue:@"bundelkhand_6" forKey:@"image_name"];
        [paramDict setValue:title_Bundelkhand_Irrigation_project forKey:@"title"];
        ImageItemModel *item6 = [[ImageItemModel alloc]initWithDict:paramDict];
        [self.imageDataArray addObject:item6];
    }
    
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
//    return 8;
    return [self.imageDataArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageItemModel *imageModel = [self.imageDataArray objectAtIndex:indexPath.item];
    UICollectionViewCell *cell = [self.maincollectionView dequeueReusableCellWithReuseIdentifier:TILE_IDENTIFIER forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    
    [cell.contentView addSubview:imageView];
  
    [imageView setImage:[UIImage imageNamed:@"partylogo"]];
    
    if(imageModel.image_name.length > 2)
    {
        [imageView setImage:[UIImage imageNamed:imageModel.image_name]];
        
    }
    else{
        [imageView setImageWithURL:[NSURL URLWithString:imageModel.image]
                    placeholderImage:[UIImage imageNamed:@"partylogo"]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    ImageItemModel *imageModel = [self.imageDataArray objectAtIndex:indexPath.item];
    if(imageModel && ([imageModel.image length] > 0 || [imageModel.image_name length] > 2))
    {
        ImageDetailsViewController *imgDetailsVC = [[ImageDetailsViewController alloc]init];
        imgDetailsVC.imageURLString =imageModel.image;
        imgDetailsVC.imageDataArray = [self.imageDataArray mutableCopy];
        imgDetailsVC.selectedIndex = (int)indexPath.item;
        [self.navigationController pushViewController:imgDetailsVC animated:YES];
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cellWidth = ((self.maincollectionView.frame.size.width/3) - 2.5);
    return CGSizeMake(cellWidth , cellWidth);
}



@end
