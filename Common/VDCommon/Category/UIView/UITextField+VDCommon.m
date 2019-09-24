//
//  UITextField+VDCommon.m
//  Common
//
//  Created by volientDuan on 2019/6/25.
//  Copyright © 2019 volientDuan. All rights reserved.
//

#import "UITextField+VDCommon.h"
#import <objc/runtime.h>

#import "UIControl+VDEvent.h"
static char *VDPlaceholderColorKey = "vd_placeholderColor_key";
static char *VDPlaceholderFontKey = "vd_placeholderFont_key";
static char *VDPlaceholderKey = "vd_placeholder_key";

@implementation UITextField (VDCommon)

- (NSString *)vd_placeholder {
    NSString *str = objc_getAssociatedObject(self, VDPlaceholderKey);
    if (!str) {
        str = self.placeholder;
    }
    return str?:@"";
}

- (void)setVd_placeholder:(NSString *)vd_placeholder {
    objc_setAssociatedObject(self, VDPlaceholderKey, vd_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:vd_placeholder attributes:@{NSForegroundColorAttributeName:self.vd_placeholderColor
                                                                                                        , NSFontAttributeName:self.vd_placeholderFont}];
    self.attributedPlaceholder = attrStr;
}

- (UIColor *)vd_placeholderColor {
    UIColor *color = objc_getAssociatedObject(self, VDPlaceholderColorKey);
    return color?:UIColor.lightGrayColor;
}

- (void)setVd_placeholderColor:(UIColor *)vd_placeholderColor {
    objc_setAssociatedObject(self, VDPlaceholderColorKey, vd_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:self.vd_placeholder attributes:@{NSForegroundColorAttributeName:vd_placeholderColor, NSFontAttributeName:self.vd_placeholderFont}];
    self.attributedPlaceholder = attrStr;
}

- (UIFont *)vd_placeholderFont {
    UIFont *font = objc_getAssociatedObject(self, VDPlaceholderFontKey);
    return font?:self.font;
}

- (void)setVd_placeholderFont:(UIFont *)vd_placeholderFont {
    objc_setAssociatedObject(self, VDPlaceholderFontKey, vd_placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:self.vd_placeholder attributes:@{NSForegroundColorAttributeName:self.vd_placeholderColor, NSFontAttributeName:vd_placeholderFont}];
    self.attributedPlaceholder = attrStr;
    
}

- (VDTextFieldBlock)vd_textChanged {
    return ^(VDTextValueCallBack callback){
        self.vd_valueChanged(^(id sender){
            NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; // 键盘输入模
            if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
                UITextRange *selectedRange = [self markedTextRange];
                if (!selectedRange) {
                    callback(self.text);
                }
            } else {
                callback(self.text);
            }
        });
        return self;
    };
}





@end
