//
//  UIControl+VDEvent.m
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIControl+VDEvent.h"
#import <objc/runtime.h>

/**
 事件回调响应类
 */
@interface VDEventCallbackMaker : NSObject
@property (nonatomic, copy)VDControlEventCallBack callback;
+ (instancetype)makeWithControl:(UIControl *)target event:(UIControlEvents)evt callback:(VDControlEventCallBack)callback;
- (void)controlEventAction:(id)sender;

@end
@implementation VDEventCallbackMaker

+ (instancetype)makeWithControl:(UIControl *)control event:(UIControlEvents)evt callback:(VDControlEventCallBack)callback {
    
    VDEventCallbackMaker *maker = [[VDEventCallbackMaker alloc]init];
    maker.callback = callback;
    [control addTarget:maker action:@selector(controlEventAction:) forControlEvents:evt];
    return maker;
}

- (void)controlEventAction:(id)sender {
    
    if (self.callback) {
        self.callback(sender);
    }
}

@end

static char *VDEventCallbacksKey = "VDEventCallbacksKey";

/**
 事件回调管理者
 */
@interface UIControl (VDEventCallbacks)
@property (nonatomic, strong)NSMutableDictionary *vdEventcallBacks;

@end

@implementation UIControl (VDEventCallbacks)

- (void)setVdEventcallBacks:(NSMutableDictionary *)vdEventcallBacks {
    objc_setAssociatedObject(self, VDEventCallbacksKey, vdEventcallBacks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)vdEventcallBacks {
    NSMutableDictionary *dic = objc_getAssociatedObject(self, VDEventCallbacksKey);
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        self.vdEventcallBacks = dic;
    }
    return dic;
}

@end

@implementation UIControl (VDEvent)

#pragma mark Method

- (VDControlEventsBlock)vd_event {
    return ^(UIControlEvents evt, VDControlEventCallBack callback){
        [self vd_setEvt:evt callback:callback];
        return self;
    };
}

- (VDControlEventBlock)vd_touchUpInsideEvent {
    return ^(VDControlEventCallBack callback){
        [self vd_setEvt:UIControlEventTouchUpInside callback:callback];
        return self;
    };
}

- (VDControlEventBlock)vd_valueChanged {
    return ^(VDControlEventCallBack callback){
        [self vd_setEvt:UIControlEventEditingChanged callback:callback];
        return self;
    };
}

- (void)vd_setEvt:(UIControlEvents)evt callback:(VDControlEventCallBack)callback {
    VDEventCallbackMaker *maker = [VDEventCallbackMaker makeWithControl:self event:evt callback:callback];
    [self.vdEventcallBacks setValue:maker forKey:[@(evt) stringValue]];
}


@end
