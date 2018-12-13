//
//  UIView+VDGesture.m
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIView+VDGesture.h"
#import <objc/runtime.h>

static char *VDSingleTapGestureKey = "VDSingleTapGestureKey";
static char *VDDoubleTapGestureKey = "VDDoubleTapGestureKey";
static char *VDLongPressGestureKey = "VDLongPressGestureKey";

static char *VDSingleCallBackKey = "VDSingleCallBackKey";
static char *VDDoubleCallBackKey = "VDDoubleCallBackKey";
static char *VDLongPressCallBackKey = "VDLongPressCallBackKey";

@implementation UIView (VDGesture)

#pragma mark Method

- (UIView * (^)(void (^)(UITapGestureRecognizer *)))vd_singleTap {
    return ^(void(^callback)(UITapGestureRecognizer *)){
        [self vd_singleTap:callback];
        return self;
    };
}

- (UIView * (^)(void (^)(UITapGestureRecognizer *)))vd_doubleTap {
    return ^(void(^callback)(UITapGestureRecognizer *)){
        [self vd_doubleTap:callback];
        return self;
    };
}

- (UIView * (^)(NSUInteger, void (^)(UILongPressGestureRecognizer *)))vd_longPress {
    return ^(NSUInteger sec, void(^callback)(UILongPressGestureRecognizer *)){
        [self vd_longPressWithSec:sec callback:callback];
        return self;
    };
}

- (void)vd_singleTap:(void (^)(UITapGestureRecognizer *))callback {
    [self setVDSingleCallBack:callback];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vdSingleTapAction:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    [self setVDSingleTapGesture:tap];
}

- (void)vd_doubleTap:(void (^)(UITapGestureRecognizer *))callback {
    [self setVDDoubleCallBack:callback];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vdDoubleTapAction:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
    [self setVDDoubleTapGesture:tap];
}

- (void)vd_longPressWithSec:(NSInteger)sec callback:(void (^)(UILongPressGestureRecognizer *))callback {
    [self setVDLongPressCallBack:callback];
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(vdLongPressAction:)];
    press.minimumPressDuration = sec;
    [self addGestureRecognizer:press];
    [self setVDLongPressGesture:press];
}

#pragma mark Gesture

- (void)setVDSingleTapGesture:(UITapGestureRecognizer *)tap {
    
    objc_setAssociatedObject(self, VDSingleTapGestureKey, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self checkGestures];
}

- (UITapGestureRecognizer *)vdSingleTapGesture {
    return objc_getAssociatedObject(self, VDSingleTapGestureKey);
}

- (void)setVDDoubleTapGesture:(UITapGestureRecognizer *)tap {

    objc_setAssociatedObject(self, VDDoubleTapGestureKey, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self checkGestures];
}

- (UITapGestureRecognizer *)vdDoubleTapGesture {
    
    return objc_getAssociatedObject(self, VDDoubleTapGestureKey);
}

- (void)setVDLongPressGesture:(UILongPressGestureRecognizer *)press {
    
    objc_setAssociatedObject(self, VDLongPressGestureKey, press, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self checkGestures];
}

- (UILongPressGestureRecognizer *)vdLongPress {
    
    return objc_getAssociatedObject(self, VDLongPressGestureKey);
}

- (void)checkGestures {
    // 单双击手势冲突
    if ([self vdSingleTapGesture]&&[self vdDoubleTapGesture]) {
        [[self vdSingleTapGesture] requireGestureRecognizerToFail:[self vdDoubleTapGesture]];
    }
    // scrollView 添加手势冲突问题
    if ([self isKindOfClass:[UIScrollView class]]) {
        
        ((UIScrollView *)self).canCancelContentTouches=NO;
        ((UIScrollView *)self).delaysContentTouches=NO;
    }
}

#pragma mark Callback

- (void)setVDSingleCallBack:(void (^)(UITapGestureRecognizer *))callback {
    
    objc_setAssociatedObject(self, VDSingleCallBackKey, callback, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITapGestureRecognizer *))vdSingleCallBack {
    
    return objc_getAssociatedObject(self, VDSingleCallBackKey);
}

- (void)setVDDoubleCallBack:(void (^)(UITapGestureRecognizer *))callback {
    
    objc_setAssociatedObject(self, VDDoubleCallBackKey, callback, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITapGestureRecognizer *))vdDoubleCallBack {
    
    return objc_getAssociatedObject(self, VDDoubleCallBackKey);
}

- (void)setVDLongPressCallBack:(void (^)(UILongPressGestureRecognizer *))callback {
    
    objc_setAssociatedObject(self, VDLongPressCallBackKey, callback, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UILongPressGestureRecognizer *))vdLongPressCallBack {
    
    return objc_getAssociatedObject(self, VDLongPressCallBackKey);
}

#pragma mark Selector

- (void)vdSingleTapAction:(UITapGestureRecognizer *)tap {
    if ([self vdSingleCallBack]) {
        [self vdSingleCallBack](tap);
    }
}

- (void)vdDoubleTapAction:(UITapGestureRecognizer *)tap {
    if ([self vdSingleCallBack]) {
        [self vdDoubleCallBack](tap);
    }
}

- (void)vdLongPressAction:(UILongPressGestureRecognizer *)press {
    if ([self vdSingleCallBack]) {
        [self vdLongPressCallBack](press);
    }
}

@end
