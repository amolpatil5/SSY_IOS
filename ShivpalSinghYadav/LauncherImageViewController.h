//
//  LauncherImageViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LauncherImageViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIButton *englishBtn;
@property (weak, nonatomic) IBOutlet UIButton *hindiBtn;

- (IBAction)englishBtnClicked:(id)sender;
- (IBAction)hindiBtnClicked:(id)sender;


@end
