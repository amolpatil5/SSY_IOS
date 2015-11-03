//
//  BioDataTableViewCell.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 26/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMPLabel.h"

@interface BioDataTableViewCell : UITableViewCell
{
    
}

@property (weak, nonatomic) IBOutlet AMPLabel *titleLbl;
@property (weak, nonatomic) IBOutlet AMPLabel *descLbl;

@end
