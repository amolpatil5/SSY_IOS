//
//  ConstituencyViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConstituencyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{

}
@property (strong,nonatomic)NSMutableArray *constituencydataArray;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UILabel *headerLbl;

@end
