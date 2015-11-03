//
//  OngoingProjectsViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 12/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OngoingProjectsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
     NSURLConnection *currentConnection;
}


@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (strong,nonatomic)NSMutableArray *eventsDataArray;
@property (retain, nonatomic) NSMutableData *apiReturnData;

@end
