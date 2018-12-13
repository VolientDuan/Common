//
//  FirstViewController.m
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:self.firstTitle forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
}
- (void)btnClick {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.block) {
            self.block();
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
