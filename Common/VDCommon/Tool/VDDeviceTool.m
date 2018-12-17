//
//  VDDeviceTool.m
//  Common
//
//  Created by volientDuan on 2018/12/17.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDDeviceTool.h"
#define VDInfoDic [[NSBundle mainBundle] infoDictionary]

@implementation VDDeviceTool

+ (NSString *)vendorId {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}
+ (NSString *)phoneName {
    return [UIDevice currentDevice].name;
}
+ (NSString *)phoneModel {
    return [UIDevice currentDevice].model;
}
+ (NSString *)localizedModel {
    return [UIDevice currentDevice].localizedModel;
}
+ (NSString *)systemVersion {
    return [UIDevice currentDevice].systemVersion;
}
+ (NSString *)systemName {
    return [UIDevice currentDevice].systemName;
}
+ (UIDeviceBatteryState)batteryState {
    return [UIDevice currentDevice].batteryState;
}
+ (CGFloat)batteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

+ (NSString *)appVersion {
    return [VDInfoDic objectForKey:@"CFBundleShortVersionString"];
}
+ (NSString *)appBuildNo {
    return [VDInfoDic objectForKey:@"CFBundleVersion"];
}


@end
