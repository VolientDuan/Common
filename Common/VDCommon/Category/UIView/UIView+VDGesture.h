//
//  UIView+VDGesture.h
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDGesture)
- (UIView * (^)(void (^)(UITapGestureRecognizer *)))vd_singleTap;
- (UIView * (^)(void (^)(UITapGestureRecognizer *)))vd_doubleTap;
- (UIView * (^)(NSUInteger, void (^)(UILongPressGestureRecognizer *)))vd_longPress;

@end
