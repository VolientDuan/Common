//
//  VDJumpTool.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDJumpTool : NSObject

/**
 页面跳转工具

 @param vcName 目标控制器命名
 @param param 额外参数，参数说明：param的key值对应目标控制器需要赋值的的属性名
 */
+ (void)jumpToVC:(NSString *)vcName param:(NSDictionary *)param;

@end
