//
//  LoginViewController.m
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/21/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import "LoginViewController.h"
#import "DataSource.h"

@interface LoginViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, weak) NSArray *setToolbarItems;

@end

@implementation LoginViewController

NSString *const LoginViewControllerDidGetAccessTokenNotification = @"LoginViewControllerDidGetAccessTokenNotification";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(LoadLoginPage:)];
    NSArray *items = [NSArray arrayWithObjects:homeButton, nil];
    self.setToolbarItems = items;
    [self setToolbarItems:items];
    
    self.title = NSLocalizedString(@"Login", @"Login");
    
NSString *urlString = [NSString stringWithFormat:@"https://instagram.com/oauth/authorize/?client_id=%25@&scope=likes+comments+relationships&redirect_uri=%25@&response_type=token", [DataSource instagramClientID], [self redirectURI]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

-(IBAction)LoadLoginPage:(id)sender
{
    NSString *homeString = [NSString stringWithFormat:@"https://instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token", [DataSource instagramClientID], [self redirectURI]];
    NSURL *home = [NSURL URLWithString:homeString];
    
    if (home) {
        NSURLRequest *request = [NSURLRequest requestWithURL:home];
        [self.webView loadRequest:request];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)redirectURI {
    return @"http://ksbartlettrealestate.com";
}

- (void) viewWillLayoutSubviews {
    self.webView.frame = self.view.bounds;
    //    self.toolBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
}

- (void) dealloc {
    // Removing this line can cause a flickering effect when you relaunch the app after logging in, as the web view is briefly displayed, automatically authenticates with cookies, returns the access token, and dismisses the login view, sometimes in less than a second.
    [self clearInstagramCookies];
    
    // see https://developer.apple.com/library/ios/documentation/uikit/reference/UIWebViewDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40006951-CH3-DontLinkElementID_1
    self.webView.delegate = nil;
}

/**
 Clears Instagram cookies. This prevents caching the credentials in the cookie jar.
 */
- (void) clearInstagramCookies {
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        NSRange domainRange = [cookie.domain rangeOfString:@"instagram.com"];
        if(domainRange.location != NSNotFound) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlString = request.URL.absoluteString;
    if ([urlString hasPrefix:[self redirectURI]]) {
        // This contains our auth token
        NSRange rangeOfAccessTokenParameter = [urlString rangeOfString:@"access_token="];
        NSUInteger indexOfTokenStarting = rangeOfAccessTokenParameter.location + rangeOfAccessTokenParameter.length;
        NSString *accessToken = [urlString substringFromIndex:indexOfTokenStarting];
        [[NSNotificationCenter defaultCenter] postNotificationName:LoginViewControllerDidGetAccessTokenNotification object:accessToken];
        
        return NO;
    }
    
    return YES;
}

@end