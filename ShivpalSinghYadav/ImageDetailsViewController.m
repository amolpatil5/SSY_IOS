//
//  ImageDetailsViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 13/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "ImageDetailsViewController.h"
#import "VIPhotoView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LocalizationConstant.h"

#import "ImageItemModel.h"
#import "LocalizationConstant.h"
#import "Constants.h"


@interface ImageDetailsViewController ()

@end

@implementation ImageDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = IMAGE_GALLARY;
    [self.mainScrollView setDelegate:self];
    [self.mainScrollView setFrame:CGRectMake(self.mainScrollView.frame.origin.x, self.mainScrollView.frame.origin.x, [UIScreen mainScreen].bounds.size.width, self.mainScrollView.frame.size.height)];
    [self addImagesToScrollView];
}


-(void)addImagesToScrollView
{
   for(UIImageView *imgView in self.mainScrollView.subviews)
    {
        [imgView removeFromSuperview];
    }
    
    self.mainScrollView.canCancelContentTouches = YES;
    self.pageControl.numberOfPages = [self.imageDataArray count];
    for ( int i = 0; i < self.pageControl.numberOfPages; i++)
    {
        ImageItemModel *imageDataModel = (ImageItemModel *)[self.imageDataArray objectAtIndex:i];
        
        CGRect frame;
        frame.origin.x = self.mainScrollView.frame.size.width * i;
        frame.origin.y = 0;

        frame.size = self.mainScrollView.frame.size;
        
        UIImageView *imageView  = [[UIImageView alloc]init];
        if([imageDataModel.image_name length]>2)
        {
            [imageView setImage:[UIImage imageNamed:imageDataModel.image_name]];
        }
        else{
        [imageView setImageWithURL:[NSURL URLWithString:imageDataModel.image]
                  placeholderImage:[UIImage imageNamed:@"head_banner"]];
        }
        VIPhotoView *photoView = [[VIPhotoView alloc] initWithFrame:frame andImage:imageView.image];
        photoView.autoresizingMask = (1 << 6) -1;
        [self.mainScrollView addSubview:photoView];
    }
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width * ([self.imageDataArray count]), self.mainScrollView.frame.size.height);
    
    self.pageControl.currentPage = self.selectedIndex;
    [self updatePageControlFor:self.selectedIndex];

}

-(void)updatePageControlFor:(int)pageIndex
{
    CGFloat pageWidth = self.mainScrollView.frame.size.width;
    CGPoint newOffset = CGPointMake(self.mainScrollView.frame.origin.x+(pageWidth * pageIndex), self.mainScrollView.frame.origin.y );
    [self.mainScrollView setContentOffset:newOffset animated:YES];
}


#pragma mark ScrollView delegate Methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //find the page number you are on
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    //To Uncomment once code
    [self updatePageControlFor:self.pageControl.currentPage];
    
}

//dragging ends, please switch off paging to listen for this event
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *) targetContentOffset
{
    CGFloat pageWidth = self.mainScrollView.frame.size.width;
    int page = floor((self.mainScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
