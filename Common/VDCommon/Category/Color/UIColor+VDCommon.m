//
//  UIColor+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIColor+VDCommon.h"

@implementation UIColor (VDCommon)

+ (UIColor *)vRandomColor {
    return [UIColor vRandomColorWithAlpha:1.0];
}

+ (UIColor *)vRandomColorWithAlpha:(CGFloat)alpha {
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:alpha];
}

@end
