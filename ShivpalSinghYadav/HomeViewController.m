//
//  HomeViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "HomeViewController.h"
#import "TileCell.h"
#import "AppDelegate.h"
#import "BiographyViewController.h"
#import "PoliticalCareerViewController.h"
#import "PartyViewController.h"
#import "EventsViewController.h"
#import "InMediaViewController.h"
#import "VideoGallaryViewController.h"
#import "SocialMediaViewController.h"
#import "ConstituencyViewController.h"
#import "DepartmentsViewController.h"
#import "ContactsViewController.h"
#import "ImageGallaryViewController.h"
#import "OngoingProjectsViewController.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "LocalizationConstant.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#define TILE_IDENTIFIER @"TileCellID"
#define TILE_ICON_IMAGE_NAME @"TileIconImageName"
#define TILE_COLOR @"TileColor"
#define TILE_TITLE @"TileTitle"


#define TILE_COUNT 11

@synthesize mainCollectionView;
@synthesize mainCollectionFlowLayout;
@synthesize tileDataArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain
           target:self action:@selector(shareBtnClicked:)];
        [anotherButton setImage:[UIImage imageNamed:@"share_icon"]];
        self.navigationItem.rightBarButtonItem = anotherButton;
    }
    return self;
}

-(void)shareBtnClicked:(id)sender
{
    NSLog(@"shareBtnClicked");
    
    NSArray *Items   = [NSArray arrayWithObjects:
                        @"Shivpal Singh Yadav",@"Download application from ",[NSURL URLWithString:@"https://itunes.apple.com/in/app/id991382970?mt=8&ign-mpt=uo%3D6"], nil];
    
    UIActivityViewController *ActivityView =
    [[UIActivityViewController alloc]
     initWithActivityItems:Items applicationActivities:nil];
    [self presentViewController:ActivityView animated:YES completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:NO];
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:(UIBarMetricsDefault)];
    
    
    [self.navigationItem setTitle:APP_NAME];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"TileCell" bundle:nil]forCellWithReuseIdentifier:TILE_IDENTIFIER];
    
    [self populateTileData];
    
    [self.mainCollectionView setDelegate:self];
    [self.mainCollectionView setDataSource:self];
    
    // Configure layout
    //self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //[self.mainCollectionFlowLayout setItemSize:CGSizeMake(95, 95)];
    [self.mainCollectionFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mainCollectionFlowLayout.minimumInteritemSpacing = 2.5f;
    self.mainCollectionFlowLayout.minimumLineSpacing = 2.5f;
    [self.mainCollectionView setCollectionViewLayout:self.mainCollectionFlowLayout];
    
    self.mainCollectionView.bounces = YES;
    [self.mainCollectionView setShowsHorizontalScrollIndicator:NO];
    [self.mainCollectionView setShowsVerticalScrollIndicator:NO];
    
//   [self checkForUpgrade];
}


-(void)checkForUpgrade
{
    NSString *appversion = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    
    NSString *finalURLString = [NSString stringWithFormat:@"%@?current_version=%@?ios=%@",UPGRADE_URL,appversion,[NSNumber numberWithBool:TRUE]];
    
    NSURL *restURL = [NSURL URLWithString:finalURLString];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    if(currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnData = nil;
    }
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    // If the connection was successful, create the XML that will be returned.
    self.apiReturnData = [NSMutableData data];
    
}

-(void)populateTileData
{
    if(!self.tileDataArray)
    {
        self.tileDataArray = [[NSMutableArray alloc]init];
    }
    [self.tileDataArray removeAllObjects];
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithObjects:BIOGRAPHY,POLITICAL_CAREER,SAMAJWADI_PARTY,EVENTS,VIDEO_GALLARY,SOCIAL_MEDIA,CONSTITUENCY,DEPARTMENTS,CONTACT,IMAGE_GALLARY,ONGOING_PROJECTS, nil];
    
    NSMutableArray *colorArray = [[NSMutableArray alloc]initWithObjects:@"#d0021b", @"#4a90e2",@"#f5a623", @"#bd10e0",@"#d0021b",@"#4a90e2", @"#f5a623",@"#bd10e0",@"#d0021b",@"#d0021b",@"#4a90e2", nil];
    
    NSMutableArray *imageArray = [[NSMutableArray alloc]initWithObjects:@"ic_1",@"ic_9",@"ic_5",@"ic_4",@"ic_6",@"ic_7",@"ic_10",@"ic_11",@"ic_3",@"ic_4",@"ic_9", nil];
    
    for(int index = 0;index < TILE_COUNT ;index++)
    {
        NSMutableDictionary *tileDict = [[NSMutableDictionary alloc]init];
        [tileDict setValue:[titleArray objectAtIndex:index] forKey:TILE_TITLE];
        [tileDict setValue:[colorArray objectAtIndex:index] forKey:TILE_COLOR];
        [tileDict setValue:[imageArray objectAtIndex:index] forKey:TILE_ICON_IMAGE_NAME];
        [self.tileDataArray addObject:tileDict];
    }
}


#pragma Connection delegate Methods
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.apiReturnData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    [self.apiReturnData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
    //NSLog(@"URL Connection Failed!");
    currentConnection = nil;
   
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    currentConnection = nil;
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:self.apiReturnData options:kNilOptions error:&error];
    
    if (error != nil)
    {
        //NSLog(@"Error parsing JSON.");
    }
    else
    {
       
        BOOL isUpgradeRequired = [[jsonDict valueForKey:@"flag"] boolValue];
        if(isUpgradeRequired)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upgrade Message" message:@"A New Version of Application is available.To download click on Upgrade. Thank you." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Upgrade", nil];
            [alert show];
            
        }
    }
    
}

#pragma UILaertView Delegate Methodss
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        //Open App Store
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/in/app/id991382970?mt=8&ign-mpt=uo%3D6"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIcollectioView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return TILE_COUNT;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TileCell *tcell = (TileCell *)[self.mainCollectionView dequeueReusableCellWithReuseIdentifier:TILE_IDENTIFIER forIndexPath:indexPath];
    
    NSDictionary *tileDict = [[self.tileDataArray objectAtIndex:indexPath.item] mutableCopy];
    tcell.backgroundColor = [UIColor colorwithHexString:[tileDict valueForKey:TILE_COLOR] alpha:1.0];
    [tcell.titleLbl setText:[tileDict valueForKey:TILE_TITLE]];
    [tcell.iconImageView setImage:[UIImage imageNamed:[tileDict valueForKey:TILE_ICON_IMAGE_NAME]]];
    return tcell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    switch (indexPath.item)
    {
            //Biography
        case 0:
        {
            BiographyViewController *bioVC = [[BiographyViewController alloc]init];
            [self.navigationController pushViewController:bioVC animated:YES];
        }
            break;
            //Political Career
        case 1:
        {
            PoliticalCareerViewController *polyVC = [[PoliticalCareerViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
            
            //Party
        case 2:
        {
            PartyViewController *polyVC = [[PartyViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
            
            //Events
        case 3:
        {
            EventsViewController *polyVC = [[EventsViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
//            //InMedia
//        case 4:
//        {
//            WebViewViewController *webVC = [[WebViewViewController alloc]init];
//            webVC.strUrl = IN_MEDIA_URL;
//            webVC.strTitle = IN_MEDIA;
//            
//            [self.navigationController pushViewController:webVC animated:YES];
//        }
//            break;
//            //Video
        case 4:
        {
            WebViewViewController *webVC = [[WebViewViewController alloc]init];
            webVC.strUrl = YOUTUBE_URL;
            webVC.strTitle = VIDEO_GALLARY;
            
            [self.navigationController pushViewController:webVC animated:YES];
        }
            
            break;
            //Social Media
        case 5:
      {
          self.firstVC = [[WebViewViewController alloc] initWithNibName:@"WebViewViewController"
                                                                 bundle:[NSBundle mainBundle]];
          self.firstVC.strUrl = FACEBOOK_URL;
          [self.firstVC.tabBarItem setImage:[UIImage imageNamed:@"facebook_icon"]];
    
          self.firstVC.tabBarItem.title= FACEBOOK_TITLE;
          
          
          //create the view controller for the second tab
          self.secondtVC = [[WebViewViewController alloc] initWithNibName:@"WebViewViewController"
                                                                   bundle:[NSBundle mainBundle]];
          self.secondtVC.strUrl =  GOOGLE_PLUS_URL;
          [self.secondtVC.tabBarItem setImage:[UIImage imageNamed:@"google_icon"]];
          self.secondtVC.tabBarItem =[[UITabBarItem alloc] initWithTitle:GOOGLE_PLUS_TITLE image:[UIImage imageNamed:@"google_icon.png"] tag:0];
          
 
          self.thirdVC = [[WebViewViewController alloc] initWithNibName:@"WebViewViewController"
                                                                   bundle:[NSBundle mainBundle]];
          self.thirdVC.strUrl =  TWITTER_URL;
          self.thirdVC.tabBarItem.title = TWITTER_TITLE;
          [self.thirdVC.tabBarItem setImage:[UIImage imageNamed:@"twitter_icon"]];
          //self.thirdVC.strTitle = TWITTER_TITLE;
          
          
          //create an array of all view controllers that will represent the tab at the bottom
          NSArray *myViewControllers = [[NSArray alloc] initWithObjects:
                                        self.firstVC,
                                        self.secondtVC,self.thirdVC, nil];
          
          //initialize the tab bar controller
          self.tabBarVC = [[UITabBarController alloc] init];
          
          //set the view controllers for the tab bar controller
          [self.tabBarVC setViewControllers:myViewControllers];
          [self.tabBarVC setTitle:SOCIAL_MEDIA];
          
         // self.tabBarVC.tabBar.backgroundImage = [UIImage imageNamed:@"navbar.png"];
         
          
          
          [self.navigationController pushViewController:self.tabBarVC animated:YES];
        }
            break;
            
            //Constituency
        case 6:
        {
            ConstituencyViewController *polyVC = [[ConstituencyViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
            
            //Department
        case 7:
        {
            DepartmentsViewController *polyVC = [[DepartmentsViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
            
            //Contact
        case 8:
        {
            ContactsViewController *polyVC = [[ContactsViewController alloc]init];
            [self.navigationController pushViewController:polyVC animated:YES];
        }
            break;
            
            //Image Gallary
        case 9:
        {
             ImageGallaryViewController *imgGallaryVC = [[ImageGallaryViewController alloc]init];
            [self.navigationController pushViewController:imgGallaryVC animated:YES];
        }
            break;
       //Ongoing Projects
        case 10:
        {
            OngoingProjectsViewController *onGoingProjVC = [[OngoingProjectsViewController alloc]init];
            [self.navigationController pushViewController:onGoingProjVC animated:YES];
        }
            break;
            
            
            
            
        default:
            break;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cellWidth = ((self.mainCollectionView.frame.size.width/3) - 2.5);
    return CGSizeMake(cellWidth , cellWidth);
   // return CGSize(width: collectionView.frame.size.width/3, height: whatever height you want)
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    TileCell *cell = (TileCell*)[self.mainCollectionView cellForItemAtIndexPath:indexPath];
    [cell selectThisTile];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    TileCell *cell = (TileCell*)[self.mainCollectionView cellForItemAtIndexPath:indexPath];
    [cell deselectThisTile];
}

@end
