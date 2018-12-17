//
//  ViewController.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    NSLog(@"systemName:%@",VDDeviceTool.systemName);
    NSLog(@"systemVersion:%@",VDDeviceTool.systemVersion);
    NSLog(@"appVersion:%@",VDDeviceTool.appVersion);
    NSLog(@"appBuildNo:%@",VDDeviceTool.appBuildNo);
    // Do any additional setup after loading the view.
}

- (void)initUI {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    button.backgroundColor = UIColor.blackColor;
    [self.view addSubview:button];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.vd_event(UIControlEventTouchUpInside,^(UIButton *btn){
        [self jumpToolTest];
        NSLog(@"UIControlEventTouchUpInside");
    }).vd_event(UIControlEventTouchDown, ^(UIButton *btn){
        
        NSLog(@"UIControlEventTouchDown");
    });
    
    UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(20, button.v_bottom+20, 100, 100)];
    [self.view addSubview:tapView];
    tapView.backgroundColor = UIColor.orangeColor;
    tapView.vd_singleTap(^(UITapGestureRecognizer *tap){
        
        NSLog(@"this is single tap");
    }).vd_doubleTap(^(UITapGestureRecognizer *tap){
        
        NSLog(@"this is double tap");
    }).vd_longPress(2, ^(UILongPressGestureRecognizer *longPress){
        
        NSLog(@"this is long press: state is %ld",longPress.state);
    });
    
    UITextField *textField = [UITextField vd_textFieldWithFrame:CGRectMake(button.v_right+20, button.v_top, 100, 100) textColor:UIColor.whiteColor font:[UIFont systemFontOfSize:15] placeholder:@"please input"];
    textField.backgroundColor = UIColor.brownColor;
    [self.view addSubview:textField];
    textField.vd_valueChanged(^(UITextField *textFd){
        
        NSLog(@"textField value changed: %@",textFd.text);
    }).vd_event(UIControlEventEditingDidEndOnExit, ^(UITextField *textFd){
        
        [textFd resignFirstResponder];
        NSLog(@"textField end editing");
    });
}

- (void)jumpToolTest {
    [VDJumpTool jumpToVC:@"FirstViewController" param:@{@"firstTitle":@"back",@"block":^{
        
        NSLog(@"back finished");
    }}];
}
@end
