//
//  EventDetailViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 11/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsDatamodel.h"

@interface EventDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
}

@property (weak, nonatomic)  EventsDatamodel *eventdataModel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end
