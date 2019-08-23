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
    textField.vd_placeholderFont = [UIFont systemFontOfSize:20];
    textField.vd_placeholderColor = UIColor.redColor;
    [self.view addSubview:textField];
    textField.vd_textChanged(^(NSString *str){
        
        NSLog(@"textField value changed: %@",str);
    }).vd_event(UIControlEventEditingDidEndOnExit, ^(UITextField *textFd){
        
        [textFd resignFirstResponder];
        NSLog(@"textField end editing");
    });
    
    UIView *textAnimView = [[UIView alloc]initWithFrame:CGRectMake(textField.v_x, textField.v_bottom+20, 100, 100)];
    textAnimView.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:textAnimView];
    [VDAnimation setAnimationWithText:@"V D" fontName:@"Avenir-BlackOblique" fontSize:40.0 fillColor:UIColor.whiteColor strokeColor:UIColor.redColor lineWidth:1.0 duration:2.5 toView:textAnimView];
    
    NSString *str = @"123QW567QW9QW";
    UILabel *label = [UILabel vd_labelWithFrame:CGRectMake(20, textAnimView.v_bottom + 20, 100, 100) title:@"" color:UIColor.blackColor font:[UIFont systemFontOfSize:15]];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
    label.attributedText = [attStr vd_setFont:nil color:UIColor.redColor text:@"QW" index:1];
    [self addGradientLayerWithColors:@[UIColor.grayColor, UIColor.orangeColor]];
    
    [self maskTest];
    [self lineTest];
}

- (void)addGradientLayerWithColors:(NSArray *)colors {
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 600, 300, 20)];
    testLabel.text = @"我是渐变色";
    testLabel.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:testLabel];
    testLabel.v_textColors = colors;
    testLabel.userInteractionEnabled = YES;
    testLabel.vd_singleTap(^(UITapGestureRecognizer *tap){
        testLabel.font = [UIFont systemFontOfSize:9];
        testLabel.frame = CGRectMake(20, 600, 300, 10);
        testLabel.textColor = UIColor.blackColor;
    });
}

- (void)maskTest {
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(200, 600, 100, 100)];
    UILabel *maskView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    maskView.text = @"心好累";
    maskView.textAlignment = NSTextAlignmentCenter;
    maskView.layer.borderWidth = 1;
    maskView.layer.borderColor = UIColor.blackColor.CGColor;
    maskView.v_cornerRadius = 50;
    [testView addSubview:maskView];
    
    CAGradientLayer *colorLayer = [testView v_getColorsLayer:@[UIColor.orangeColor, UIColor.grayColor] frame:CGRectMake(0, 0, 100, 100) isHorizontal:NO];
    colorLayer.mask = maskView.layer;
    [testView.layer insertSublayer:colorLayer atIndex:0];
    [self.view addSubview:testView];
}

- (void)lineTest {
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(200, 500, 100, 100)];
    [self.view addSubview:testView];
    //create path
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 100)];
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    shapeLayer.lineDashPattern = @[@4, @4];//画虚线
    //add it to our view
    [testView.layer addSublayer:shapeLayer];
    
    UIView *point = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
    point.v_cornerRadius = 6;
    point.backgroundColor = UIColor.lightGrayColor;
    point.center = CGPointMake(50, 50);
    UIView *innerPoint = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 8)];
    innerPoint.v_cornerRadius = 4;
    innerPoint.backgroundColor = UIColor.blackColor;
    innerPoint.center = CGPointMake(6, 6);
    [point addSubview:innerPoint];
    [testView addSubview:point];
}

- (void)jumpToolTest {
    [VDJumpTool jumpToVC:@"FirstViewController" param:@{@"firstTitle":@"back",@"block":^{
        
        NSLog(@"back finished");
    }}];
}
@end
