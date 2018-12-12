//
//  UIView+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIView+VDCommon.h"

@implementation UIView (VDCommon)
// [GET方法]

- (CGFloat)v_x{
    return self.frame.origin.x;
}

- (CGFloat)v_y{
    return self.frame.origin.y;
}

- (CGFloat)v_w{
    return self.frame.size.width;
}

- (CGFloat)v_h{
    return self.frame.size.height;
}

- (CGFloat)v_centerX{
    return self.center.x;
}

- (CGFloat)v_centerY{
    return self.center.y;
}
- (CGFloat)v_top{
    return self.v_y;
}
- (CGFloat)v_left{
    return self.v_x;
}
- (CGFloat)v_bottom{
    return (self.v_y + self.v_h);
}
- (CGFloat)v_right{
    return (self.v_x + self.v_w);
}
- (CGSize)v_size{
    return self.frame.size;
}
- (CGPoint)v_origin{
    return self.frame.origin;
}
// [SET方法]

- (void)setV_x:(CGFloat)v_x{
    self.frame = CGRectMake(v_x, self.v_y, self.v_w, self.v_h);
}

- (void)setV_y:(CGFloat)v_y{
    self.frame = CGRectMake(self.v_x, v_y, self.v_w, self.v_h);
}

- (void)setV_w:(CGFloat)v_w{
    self.frame = CGRectMake(self.v_x, self.v_y, v_w, self.v_h);
}

- (void)setV_h:(CGFloat)v_h{
    self.frame = CGRectMake(self.v_x, self.v_y, self.v_w, v_h);
}

- (void)setV_centerX:(CGFloat)v_centerX{
    self.center = CGPointMake(v_centerX, self.v_centerY);
}

- (void)setV_centerY:(CGFloat)v_centerY{
    self.center = CGPointMake(self.v_centerX, v_centerY);
}
- (void)setV_size:(CGSize)v_size{
    self.frame = CGRectMake(self.v_x, self.v_y, v_size.width, v_size.height);
}
- (void)setV_origin:(CGPoint)v_origin{
    self.frame = CGRectMake(v_origin.x, v_origin.y, self.v_w, self.v_h);
}

#pragma mark [layer]

- (CGFloat)v_cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setV_cornerRadius:(CGFloat)v_cornerRadius{
    self.layer.cornerRadius = v_cornerRadius;
    self.layer.masksToBounds = YES;
}

- (NSArray<UIColor *> *)v_backgroundColors {
    return nil;
}
- (void)setV_backgroundColors:(NSArray<UIColor *> *)v_backgroundColors {
    if (v_backgroundColors == nil) {
        [self v_clearColors];
    }else {
        [self.layer insertSublayer:[self v_getColorsLayer:v_backgroundColors frame:self.bounds isHorizontal:YES] atIndex:0];
    }
    
}

#pragma mark [method]

- (CAGradientLayer *)v_getColorsLayer:(NSArray *)colors frame:(CGRect)frame isHorizontal:(BOOL)isHorizontal {
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    [layer setFrame:frame];
    NSMutableArray *arr = [NSMutableArray array];
    for (UIColor *color in colors) {
        [arr addObject:(__bridge id)color.CGColor];
    }
    [layer setColors:arr];
    [layer setStartPoint:CGPointMake(0.0, 0.0)];
    if (isHorizontal) {
        [layer setEndPoint:CGPointMake(1.0, 0.0)];
    }else {
        [layer setEndPoint:CGPointMake(0.0, 1.0)];
    }
    return layer;
}

- (void)v_clearColors {
    CALayer *colorlayer;
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            colorlayer = layer;
        }
    }
    [colorlayer removeFromSuperlayer];
}

@end
