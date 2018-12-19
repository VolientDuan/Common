//
//  WebViewController.m
//  Common
//
//  Created by volientDuan on 2018/12/19.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "WebViewController.h"
#import "VDWebView.h"
@interface WebViewController ()<VDWebViewDelegate>
@property (nonatomic, strong)VDWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

- (void)webViewDidStartLoad:(VDWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(VDWebView *)webView {
    
}

- (BOOL)webView:(VDWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"should start loading:%@",request.URL.absoluteString);
    return YES;
}

#pragma mark - property
- (VDWebView *)webView {
    if (!_webView) {
        _webView = [[VDWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-88)];
        _webView.delegate = self;
    }
    return _webView;
}
@end
