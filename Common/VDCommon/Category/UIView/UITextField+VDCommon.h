//
//  UITextField+VDCommon.h
//  Common
//
//  Created by volientDuan on 2019/6/25.
//  Copyright © 2019 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITextField (VDCommon)
@property (nonatomic, strong)UIColor *vd_placeholderColor;
@property (nonatomic, strong)UIFont *vd_placeholderFont;
// 监听textField文本输入 自动忽略中文输入高亮文字
- (UITextField *(^)(VDControlEventCallBack))vd_textChanged;

@end
