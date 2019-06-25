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

@implementation UITextField (VDCommon)

- (UIColor *)vd_placeholderColor {
    return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setVd_placeholderColor:(UIColor *)vd_placeholderColor {
    [self setValue:vd_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (UIFont *)vd_placeholderFont {
    return [self valueForKeyPath:@"_placeholderLabel.font"];
}

- (void)setVd_placeholderFont:(UIFont *)vd_placeholderFont {
    [self setValue:vd_placeholderFont forKeyPath:@"_placeholderLabel.font"];
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
