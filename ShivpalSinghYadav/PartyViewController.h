//
//  PartyViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *websiteHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *aboutHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *websiteLinkLbl;
@property (weak, nonatomic) IBOutlet UILabel *aboutDescLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UITableView *mainTableView;



@end
