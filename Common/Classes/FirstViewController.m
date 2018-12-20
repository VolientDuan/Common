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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [VDNotiHelper postNotiWithName:@"FirstViewDidAppear" object:@"FirstViewDidAppear"];
}
- (void)initUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:self.firstTitle forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    UILabel *label = [UILabel vd_labelWithFrame:CGRectMake(0, button.v_bottom+10, 300, 50) title:@"viewDidLoad" color:[UIColor vd_colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:15]];
    label.v_centerX = UIScreen.mainScreen.bounds.size.width/2;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor vd_colorWithHexString:@"#567893"];
    [self.view addSubview:label];
    
    [self vd_notiWithName:@"FirstViewDidAppear" block:^(id info) {
        label.text = info;
    }];
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

- (void)dealloc {
    
}

@end
