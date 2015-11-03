//
//  WebViewViewController.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 09/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "WebViewViewController.h"
#import "Constants.h"
#import "LocalizationConstant.h"

@interface WebViewViewController ()

@property (strong, nonatomic) NSURL *inputNSurl;
@end

@implementation WebViewViewController
@synthesize inputNSurl;
@synthesize strUrl;
@synthesize strTitle;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mainWebView setDelegate:self];
    [self setTitle:strTitle];
    
   
    self.inputNSurl = [NSURL URLWithString:strUrl];
    [self loadWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)loadWebView
{
    //Remove all Webview cache..
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    //Create New NSURL Request..
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:self.inputNSurl
                                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                                            timeoutInterval:150];
    [self.mainWebView loadRequest:requestObj];
}
-(void)sTopSpinning
{
    [self.actIndicatorSpinner stopAnimating];
}
-(void)sTartSpinning
{
    [self.actIndicatorSpinner startAnimating];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //NSLog(@"webViewDidFinishLoad =%@",webView.request);
    [webView stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout='none';"];
    [self sTopSpinning];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
     return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    [self sTartSpinning];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //NSLog(@"WebView error=%@",error);
    
    [self.actIndicatorSpinner stopAnimating];
    
    NSInteger errorCode=[error code];
    switch (errorCode)
    {
        case NSURLErrorCancelled:
            //errorCode=-999 is for webview not loaded Completely
        {
            //NSLog(@"WebView error -999. Load Blank HTML");
            //[appZoneWebView loadHTMLString:@"<!DOCTYPE html><html><head></head><body></body></html>" baseURL:nil];
        }
            break;
            
        case NSURLErrorNotConnectedToInternet:   //errorCode=-1100 --- The Internet connection appears to be offline.
        {
            [self sTopSpinning];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NETWORK_ERROR" message:NETWORK_ERROR delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
            
        case 102: //URL Not valid
        {
            //            [self sTopSpinning];
            //
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"The URL can't be shown." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
            //            [alert show];
        }
            break;
            
        case -1100:   //errorCode=-1100 --- The requested URL was not found on  server
        default:
        {
            [self sTopSpinning];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:NETWORK_ERROR delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
    }
    
}



@end
