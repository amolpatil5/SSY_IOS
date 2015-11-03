//
//  EventsViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   NSURLConnection *currentConnection;  
}
@property (strong,nonatomic)NSMutableArray *eventsDataArray;
@property (retain, nonatomic) NSMutableData *apiReturnData;


@property (weak, nonatomic) IBOutlet UITableView *mainTableview;
@property (weak, nonatomic)IBOutlet UIActivityIndicatorView *spinner;



@end
