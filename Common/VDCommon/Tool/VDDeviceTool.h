//
//  VDDeviceTool.h
//  Common
//
//  Created by volientDuan on 2018/12/17.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VDDeviceTool : NSObject

+ (NSString *)vendorId;
+ (NSString *)phoneName;
+ (NSString *)phoneModel;
+ (NSString *)localizedModel;
+ (NSString *)systemVersion;
+ (NSString *)systemName;
+ (UIDeviceBatteryState)batteryState;
+ (CGFloat)batteryLevel;

+ (NSString *)appVersion;
+ (NSString *)appBuildNo;

@end
