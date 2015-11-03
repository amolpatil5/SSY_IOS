//
//  SocialMediaViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "SocialMediaViewController.h"
#import "WebViewViewController.h"

@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController
@synthesize firstVC;
@synthesize secondtVC;
@synthesize thirdVC;
@synthesize tabBarVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstVC = [[WebViewViewController alloc] initWithNibName:nil
                                                                     bundle:NULL];
    
    //create the view controller for the second tab
    self.secondtVC = [[WebViewViewController alloc] initWithNibName:nil
                                                                       bundle:NULL];
    
    //create an array of all view controllers that will represent the tab at the bottom
    NSArray *myViewControllers = [[NSArray alloc] initWithObjects:
                                  self.firstVC,
                                  self.secondtVC, nil];
    
    //initialize the tab bar controller
    self.tabBarVC = [[UITabBarController alloc] init];
    
    //set the view controllers for the tab bar controller
    [self.tabBarVC setViewControllers:myViewControllers];
    
    //add the tab bar controllers view to the window
    [self.view addSubview:self.tabBarController.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
