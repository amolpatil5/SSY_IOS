//
//  OngoingProjectsDetailsViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 28/10/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OngoingProjectsDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate >

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *maincollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *mainCollectionLayout;

@property(strong, nonatomic)NSString *projTitle;
@property(strong, nonatomic)NSString *projDesc;
@property(strong, nonatomic)NSMutableArray* imageDataArray;




@end
