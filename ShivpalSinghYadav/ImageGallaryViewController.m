//
//  ImageGallaryViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 12/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "ImageGallaryViewController.h"
#import "LocalizationConstant.h"
#import "Constants.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "EventsDatamodel.h"

#import "TileCell.h"
#import "AppDelegate.h"
#import "ImageDetailsViewController.h"


#define TILE_IDENTIFIER @"TileCellID"
#define TILE_ICON_IMAGE_NAME @"TileIconImageName"
#define TILE_COLOR @"TileColor"
#define TILE_TITLE @"TileTitle"

@interface ImageGallaryViewController ()

@end

@implementation ImageGallaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //configure carousel
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.title = IMAGE_GALLARY;
    [self.carousel reloadData];
    self.imageDataArray = [[NSMutableArray alloc]init];
    NSURL *restURL = [NSURL URLWithString:GET_EVENTS_DATA_URL];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnData = nil;
    }
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
//    [self.spinner startAnimating];
    // If the connection was successful, create the XML that will be returned.
    self.apiReturnData = [NSMutableData data];
    
    [self.maincollectionView registerNib:[UINib nibWithNibName:@"TileCell" bundle:nil]forCellWithReuseIdentifier:TILE_IDENTIFIER];
    
//    [self populateTileData];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return (NSInteger)[self.imageDataArray count];
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
      
         EventsDatamodel *event = [self.imageDataArray objectAtIndex:index];
        [((UIImageView *)view) setImageWithURL:[NSURL URLWithString:event.image]
                            placeholderImage:[UIImage imageNamed:@"partylogo"]];
//
//        view.contentMode = UIViewContentModeCenter;
//        label = [[UILabel alloc] initWithFrame:view.bounds];
//        label.backgroundColor = [UIColor clearColor];
////        label.textAlignment = UITextAlignmentCenter;
//        label.font = [label.font fontWithSize:50];
//        label.tag = 1;
//        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
//    label.text = [self.items[(NSUInteger)index] stringValue];
    
    return view;
}

//- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
//{
//    return 0;
//}

//- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
//{
//    UILabel *label = nil;
//    
//    //create new view if no view is available for recycling
//    if (view == nil)
//    {
//        //don't do anything specific to the index within
//        //this `if (view == nil) {...}` statement because the view will be
//        //recycled and used with other index values later
//        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
//        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
//        view.contentMode = UIViewContentModeCenter;
//        
//        label = [[UILabel alloc] initWithFrame:view.bounds];
//        label.backgroundColor = [UIColor clearColor];
////        label.textAlignment = UITextAlignmentCenter;
//        label.font = [label.font fontWithSize:50.0f];
//        label.tag = 1;
//        [view addSubview:label];
//    }
//    else
//    {
//        //get a reference to the label in the recycled view
//        label = (UILabel *)[view viewWithTag:1];
//    }
//    
//    //set item label
//    //remember to always set any properties of your carousel item
//    //views outside of the `if (view == nil) {...}` check otherwise
//    //you'll get weird issues with carousel item content appearing
//    //in the wrong place in the carousel
//    label.text = (index == 0)? @"[": @"]";
//    
//    return view;
//}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
//            normally you would hard-code this to YES or NO
//            return self.wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
     NSNumber *item = (self.imageDataArray)[(NSUInteger)index];

//    NSNumber *item = (self.items)[(NSUInteger)index];
    NSLog(@"Tapped view number: %@", item);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
}


#pragma mark NSURLConnection Methods
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    [self.apiReturnData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    [self.apiReturnData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
    //NSLog(@"URL Connection Failed!");
    currentConnection = nil;
//    [self.spinner stopAnimating];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    currentConnection = nil;
//    [self.spinner stopAnimating];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:self.apiReturnData options:kNilOptions error:&error];
    
    if (error != nil) {
        //NSLog(@"Error parsing JSON.");
    }
    else
    {
        [self.imageDataArray removeAllObjects];
        NSArray *eventsArray = [jsonDict valueForKey:@"events"];
        for (NSDictionary *dict in eventsArray)
        {
            EventsDatamodel *event = [[EventsDatamodel alloc]initWithDict:dict];
            [self.imageDataArray addObject:event];
        }
        if([self.imageDataArray count]>0)
        {
            [self.carousel setHidden:NO];
            [self.carousel reloadData];
                      [self.maincollectionView reloadData];
        }
    }
}




#pragma mark - UIcollectioView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"collectionView Count = [%d]",[self.imageDataArray count]);
    return [self.imageDataArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
      EventsDatamodel *event = [self.imageDataArray objectAtIndex:indexPath.item];
//    
//    TileCell *tcell = (TileCell *)[self.maincollectionView dequeueReusableCellWithReuseIdentifier:TILE_IDENTIFIER forIndexPath:indexPath];
//    tcell.backgroundColor = [UIColor orangeColor];
//    [tcell.iconImageView  setImageWithURL:[NSURL URLWithString:event.image]
//                          placeholderImage:[UIImage imageNamed:@"partylogo"]];
//
//     return cell;
    
    
    
    UICollectionViewCell *cell = [self.maincollectionView dequeueReusableCellWithReuseIdentifier:TILE_IDENTIFIER forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    
    
    [cell.contentView addSubview:imageView];
//    cell.contentView.layer.shadowColor = [UIColor whiteColor].CGColor;
//    cell.contentView.layer.shadowRadius = 2.0;
//    
    [imageView setImageWithURL:[NSURL URLWithString:event.image]
                          placeholderImage:[UIImage imageNamed:@"partylogo"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    EventsDatamodel *event = [self.imageDataArray objectAtIndex:indexPath.item];

    if(event && [event.image length] >0)
    {
         ImageDetailsViewController *imgDetailsVC = [[ImageDetailsViewController alloc]init];
    
    imgDetailsVC.imageURLString =event.image;
        imgDetailsVC.imageDataArray = [self.imageDataArray mutableCopy];
        imgDetailsVC.selectedIndex = (int)indexPath.item;
        
//    [self presentViewController:imgDetailsVC animated:YES completion:NULL];
        [self.navigationController pushViewController:imgDetailsVC animated:YES];
    }
    
    
//    switch (indexPath.item)
//    {
//            //Biography
//        case 0:
//        {
////            BiographyViewController *bioVC = [[BiographyViewController alloc]init];
////            [self.navigationController pushViewController:bioVC animated:YES];
//        }
//            break;
//      
//    
//            
//        default:
//            break;
//    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cellWidth = ((self.maincollectionView.frame.size.width/3) - 2.5);
    return CGSizeMake(cellWidth , cellWidth);
    // return CGSize(width: collectionView.frame.size.width/3, height: whatever height you want)
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
//    TileCell *cell = (TileCell*)[self.maincollectionView cellForItemAtIndexPath:indexPath];
//    [cell selectThisTile];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
//    TileCell *cell = (TileCell*)[self.maincollectionView cellForItemAtIndexPath:indexPath];
//    [cell deselectThisTile];
}




@end
