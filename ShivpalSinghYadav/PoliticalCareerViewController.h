//
//  PoliticalCareerViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoliticalCareerViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
{
    
}


@property (weak, nonatomic) IBOutlet UILabel *politicalCareerHaderLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *politicalCareerDescLbl;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end
