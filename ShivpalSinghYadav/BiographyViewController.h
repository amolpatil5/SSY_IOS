//
//  BiographyViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BiographyViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UIView *containerView;


@property (weak, nonatomic) IBOutlet UILabel *websiteHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *websiteLinkLbl;
@property (weak, nonatomic) IBOutlet UILabel *biographyHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *biographyDescLbl;
@property (weak, nonatomic) IBOutlet UILabel *earlyLifeHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *earlyLifeDescLbl;
@property (weak, nonatomic) IBOutlet UILabel *eduQualHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *eduQualDescLbl;
@property (weak, nonatomic) IBOutlet UILabel *familyStatusHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *familyStatusDescLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end
