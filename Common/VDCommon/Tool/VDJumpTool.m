//
//  VDJumpTool.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDJumpTool.h"
#import <UIKit/UIKit.h>

@implementation VDJumpTool
+ (void)jumpToVC:(NSString *)vcName param:(NSDictionary *)param {
    
    UIViewController *vc = nil;
    UINavigationController *navi = nil;
    UIViewController *visibleVC;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    // 获取 UIWindowLevelNormal 下的窗口
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    //获取vc
    if ([vc isKindOfClass:[UIViewController class]])
        vc = nextResponder;
    else
        vc = window.rootViewController;
    //获取模态跳转的最后一个页面
    vc = [self getPresentedViewController:vc];
    //tabbar-navi的结构
    if ([vc isKindOfClass:[UITabBarController class]]) {
        navi = (UINavigationController *)(((UITabBarController *)vc).selectedViewController);
        visibleVC = navi.visibleViewController;
    }
    //navi-tabbar的结构
    else if([vc isKindOfClass:[UINavigationController class]]){
        navi = ((UINavigationController *)vc);
        visibleVC = navi.visibleViewController;
    }
    else{
        visibleVC = vc;
    }
    //需要跳转的页面的一些处理（比如传参...）
    UIViewController *toVC = [[NSClassFromString(vcName) alloc]init];
    if (param) {
        for (NSString *key in param.allKeys) {
            [toVC setValue:param[key] forKey:key];
        }
    }
    if (visibleVC.navigationController) {
        [visibleVC.navigationController pushViewController:toVC animated:YES];
    } else {
        [visibleVC presentViewController:toVC animated:YES completion:nil];
    }
    
}

/**
 获取模态跳转的最后一个视图
 @param vc 控制器
 @return 结果控制器
 */
+ (UIViewController *)getPresentedViewController:(UIViewController *)vc{
    UIViewController *this_vc = vc.presentedViewController;
    if (this_vc) {
        return [self getPresentedViewController:this_vc];
    }
    return vc;
    
}

@end
