//
//  UIView+VDInitialize.h
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDInitialize)

+ (instancetype)vd_buttonWithFrame:(CGRect)frame
                             image:(UIImage *)image
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font;

+ (instancetype)vd_labelWithFrame:(CGRect)frame
                            title:(NSString *)title
                            color:(UIColor *)color
                             font:(UIFont *)font;

+ (instancetype)vd_textFieldWithFrame:(CGRect)frame
                            textColor:(UIColor *)textColor
                                 font:(UIFont *)font
                          placeholder:(NSString *)placeholder;

@end
