//
//  AppDelegate.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "AppDelegate.h"
#import "LauncherImageViewController.h"
#import "EventsViewController.h"
#import "HelperUtility.h"
#import "Constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    //Create Window..
    self.window =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    
    if (launchOptions != nil)
    {
        NSDictionary *dictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (dictionary != nil)
        {
            NSLog(@"Launched from push notification: %@", dictionary);
            [self updateUIForReceivedNotification:dictionary updateUI:YES];
        }
    }
    else
    {
        
        
        if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
        {
            // iOS 8 Notifications
            [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
            
            [application registerForRemoteNotifications];
        }
        else
        {
            // iOS < 8 Notifications
            [application registerForRemoteNotificationTypes:
             (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
        }
        
        
        LauncherImageViewController* launchImageVC = [[LauncherImageViewController alloc] init];
        self.navigationViewController = [[UINavigationController alloc] initWithRootViewController:launchImageVC];
        self.navigationViewController.navigationItem.title = @"";
        self.navigationViewController.navigationBar.tintColor = [UIColor whiteColor];
        self.window.rootViewController = self.navigationViewController;
    }
    return YES;
}


#pragma APN Methods
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as you need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    
    NSString *urlString = [NSString stringWithFormat:@"%@?token=%@",UPGRADE_URL,token];
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSData *urlData;
    NSURLResponse *response;
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:nil];
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    NSLog(@"Received notification: %@", userInfo);
    [self updateUIForReceivedNotification:userInfo updateUI:NO];
}

- (void)updateUIForReceivedNotification:(NSDictionary*)userInfo updateUI:(BOOL)updateUI
{
    if(updateUI)
    {
        NSString *alertValue = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        NSLog(@"alertValue = [%@]",alertValue);
        
        if([alertValue isEqualToString:@"Hindi Event"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:HINDI_LANGUAGE forKey:CURRENT_LANGUAGE];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [HelperUtility setLanguage:HINDI_LANGUAGE];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:ENGLISH_LANGUAGE forKey:CURRENT_LANGUAGE];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [HelperUtility setLanguage:ENGLISH_LANGUAGE];
        }
        
        EventsViewController* eventVC = [[EventsViewController alloc] init];
        self.navigationViewController = [[UINavigationController alloc] initWithRootViewController:eventVC];
        self.navigationViewController.navigationItem.title = @"";
        self.navigationViewController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        
        self.navigationViewController.navigationItem.hidesBackButton=YES;
        [self.navigationViewController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:(UIBarMetricsDefault)];
        self.window.rootViewController = self.navigationViewController;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
