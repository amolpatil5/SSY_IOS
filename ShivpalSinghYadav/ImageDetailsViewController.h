//
//  ImageDetailsViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 13/09/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailsViewController : UIViewController<UIScrollViewDelegate>
{
    
}
@property(nonatomic,strong)NSString *imageURLString;
@property(nonatomic,strong)NSArray *imageDataArray;
@property int selectedIndex;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
