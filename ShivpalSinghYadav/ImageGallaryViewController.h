//
//  ImageGallaryViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 12/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ImageGallaryViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate ,iCarouselDataSource, iCarouselDelegate>
{
    NSURLConnection *currentConnection;
}
@property (strong,nonatomic)NSMutableArray *imageDataArray;
@property (retain, nonatomic) NSMutableData *apiReturnData;

@property (nonatomic, strong) IBOutlet iCarousel *carousel;



@property (weak, nonatomic) IBOutlet UICollectionView *maincollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *mainCollectionLayout;

@end
