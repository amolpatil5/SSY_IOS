//
//  SocialMediaViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewViewController.h"

@interface SocialMediaViewController : UIViewController
{
    
}


@property(strong , nonatomic)  UITabBarController *tabBarVC;
@property(strong , nonatomic) WebViewViewController *firstVC;
@property(strong , nonatomic) WebViewViewController *secondtVC;
@property(strong , nonatomic) WebViewViewController *thirdVC;


@end
