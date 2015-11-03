//
//  EventCellTableViewCell.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 11/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsDatamodel.h"

@interface EventCellTableViewCell : UITableViewCell
{
    
}

@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;


-(void) configureCellWithData:(EventsDatamodel *)eventModel;

@end
