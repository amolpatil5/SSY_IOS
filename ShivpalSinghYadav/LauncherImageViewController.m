//
//  LauncherImageViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "LauncherImageViewController.h"
#import "HomeViewController.h"
#import "HelperUtility.h"
#import "Constants.h"
#import "LocalizationConstant.h"

@interface LauncherImageViewController ()

@end

@implementation LauncherImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self.hindiBtn setTitle:@"हिंदी" forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)englishBtnClicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:ENGLISH_LANGUAGE forKey:CURRENT_LANGUAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HelperUtility setLanguage:ENGLISH_LANGUAGE];
    [self launchNextViewController];
}

- (IBAction)hindiBtnClicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:HINDI_LANGUAGE forKey:CURRENT_LANGUAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HelperUtility setLanguage:HINDI_LANGUAGE];
    [self launchNextViewController];
}

-(void)launchNextViewController
{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:homeVC animated:YES];
}
@end
