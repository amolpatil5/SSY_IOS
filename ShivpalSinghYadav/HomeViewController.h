//
//  HomeViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewViewController.h"

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
       NSURLConnection *currentConnection;
}

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *mainCollectionFlowLayout;

@property (strong, nonatomic) NSMutableArray *tileDataArray;


@property (retain, nonatomic) NSMutableData *apiReturnData;
@property(strong , nonatomic)  UITabBarController *tabBarVC;
@property(strong , nonatomic) WebViewViewController *firstVC;
@property(strong , nonatomic) WebViewViewController *secondtVC;
@property(strong , nonatomic) WebViewViewController *thirdVC;

@end
