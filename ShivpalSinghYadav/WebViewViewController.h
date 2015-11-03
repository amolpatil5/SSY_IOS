//
//  WebViewViewController.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController<UIWebViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@property (strong, nonatomic) NSString  *strUrl;
@property (strong, nonatomic) NSString  *strTitle;

@property (strong)IBOutlet UIActivityIndicatorView *actIndicatorSpinner;
-(void)sTopSpinning;
-(void)sTartSpinning;

@end
