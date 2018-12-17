//
//  VDNotiHelper.m
//  Common
//
//  Created by volientDuan on 2018/12/17.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDNotiHelper.h"
#import <objc/runtime.h>

@implementation VDNotiHelper

- (NSMutableDictionary *)notiBlockDic {
    if (!_notiBlockDic) {
        _notiBlockDic = [NSMutableDictionary dictionary];
    }
    return _notiBlockDic;
}

+ (void)postNotiWithName:(NSNotificationName)name object:(id)object {
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:object];
}

- (void)addNotiWithName:(NSNotificationName)notiName block:(void (^)(id))block {
    [self.notiBlockDic setValue:block forKey:notiName];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(vdNotiAction:) name:notiName object:nil];
}

- (void)vdNotiAction:(NSNotification *)noti {
    ((void(^)(id info))[self.notiBlockDic valueForKey:noti.name])(noti.object);
}

- (void)removeWithName:(NSNotificationName)name {
    [self.notiBlockDic removeObjectForKey:name];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:name object:nil];
}

- (void)remove {
    [self.notiBlockDic removeAllObjects];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)dealloc {
    [self remove];
}

@end

@interface NSObject()
@property (nonatomic, strong)VDNotiHelper *vdNotiHelper;

@end

static char *vdNotiHelperKey = "vdNotiHelper";

@implementation NSObject (VDNotiHelper)

- (void)vd_notiWithName:(NSNotificationName)name block:(void (^)(id))block {
    [self.vdNotiHelper addNotiWithName:name block:block];
}

#pragma mark - preperty

- (void)setVdNotiHelper:(VDNotiHelper *)vdNotiHelper {
    objc_setAssociatedObject(self, vdNotiHelperKey, vdNotiHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDNotiHelper *)vdNotiHelper {
    VDNotiHelper *helper = objc_getAssociatedObject(self, vdNotiHelperKey);
    if (!helper) {
        helper = [[VDNotiHelper alloc]init];
        objc_setAssociatedObject(self, vdNotiHelperKey, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return helper;
}

@end
