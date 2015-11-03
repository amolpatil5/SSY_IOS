//
//  TileCell.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 07/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "TileCell.h"

@implementation TileCell

@synthesize titleLbl;

- (void)awakeFromNib {
    // Initialization code
}

-(void)selectThisTile
{
    // apply icon color to background
    // apply backgoriund color to icon
    //254,205,5
//    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//       
//        [self.iconImageView setImage:[self.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
//         [self.iconImageView setTintColor:[UIColor blackColor]];
//        [self.titleLbl setTextColor:[UIColor blackColor]];
//        
//        self.tileSelected = YES;
//    } completion:NULL];
//    
//
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
    [UIView commitAnimations];
    
    
    
}



-(void)deselectThisTile
{
    // keep the icon color
    // keep the background color as it is.
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.iconImageView setImage:[self.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [self.iconImageView setTintColor:[UIColor whiteColor]];
        [self.titleLbl setTextColor:[UIColor whiteColor]];
        self.tileSelected = YES;
        self.tileSelected = NO;
    } completion:NULL];
}

@end
