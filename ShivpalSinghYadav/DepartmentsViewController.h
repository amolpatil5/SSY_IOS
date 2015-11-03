//
//  DepartmentsViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepartmentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong,nonatomic)NSMutableArray *deptDataArray;

@end
