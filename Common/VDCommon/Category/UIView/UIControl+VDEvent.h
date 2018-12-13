//
//  UIControl+VDEvent.h
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VDControlEventCallBack)(id);
typedef UIControl* (^VDControlEventsBlock)(UIControlEvents, VDControlEventCallBack);
typedef UIControl* (^VDControlEventBlock)(VDControlEventCallBack);

@interface UIControl (VDEvent)

- (VDControlEventsBlock)vd_event;

// 常用的按钮的点击时间
- (VDControlEventBlock)vd_touchUpInsideEvent;

// 监听textField文本输入
- (VDControlEventBlock)vd_valueChanged;

@end
