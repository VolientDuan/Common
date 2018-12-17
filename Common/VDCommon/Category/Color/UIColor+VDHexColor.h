//
//  UIColor+VDHexColor.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (VDHexColor)
/* eg: hexString  =  @"#FFFFFF", @"FFFFFF", @"0xFFFFFF" ... */
+ (UIColor *)vd_colorWithHexString:(NSString *)hexString;
+ (UIColor *)vd_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
