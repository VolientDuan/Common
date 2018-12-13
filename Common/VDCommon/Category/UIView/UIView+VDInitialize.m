//
//  UIView+VDInitialize.m
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIView+VDInitialize.h"

@implementation UIView (VDInitialize)

+ (instancetype)vd_buttonWithFrame:(CGRect)frame
                             image:(UIImage *)image
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)vd_labelWithFrame:(CGRect)frame
                            title:(NSString *)title
                            color:(UIColor *)color
                             font:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = color;
    label.font = font;
    return label;
}

+ (instancetype)vd_textFieldWithFrame:(CGRect)frame
                            textColor:(UIColor *)textColor
                                 font:(UIFont *)font
                          placeholder:(NSString *)placeholder {
    
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.textColor = textColor;
    textField.font = font;
    textField.placeholder = placeholder;
    return textField;
}



@end
