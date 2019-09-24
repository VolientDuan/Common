//
//  VDRectangleView.m
//  Common
//
//  Created by volientDuan on 2019/9/24.
//  Copyright © 2019 volientDuan. All rights reserved.
//

#import "VDRectangleView.h"

@implementation VDRectangleView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.layer.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(bezierPath.CGPath);
    pathLayer.backgroundColor = [UIColor.whiteColor CGColor];
    pathLayer.geometryFlipped = YES;
    pathLayer.path = bezierPath.CGPath;
    pathLayer.strokeColor = UIColor.orangeColor.CGColor;
    pathLayer.lineWidth = 10;
    [self.layer addSublayer:pathLayer];
    // 给绘制图层添加动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 30;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    //当动画结束移除效果-----同时可以解决页面跳转返回后动画停止问题
    pathAnimation.removedOnCompletion = YES;
    [pathLayer addAnimation:pathAnimation forKey:@"strokeStart"];
    
}

@end
