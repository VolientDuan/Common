//
//  VDAnimation.h
//  Common
//
//  Created by volientDuan on 2018/12/19.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDAnimation : NSObject
/**
 文字轨迹动画

 @param text 文字内容
 @param fontName 字体名称(可参考:http://iosfonts.com/)
 @param fontSize 字体大小
 @param fillColor 文字的填充颜色
 @param strokeColor 轨迹颜色(线条的颜色)
 @param lineWidth 线条宽度
 @param duration 动画时间
 @param view 载体
 */
+ (CABasicAnimation *)setAnimationWithText:(NSString *)text
                                  fontName:(NSString *)fontName
                                  fontSize:(CGFloat)fontSize
                                 fillColor:(UIColor *)fillColor
                               strokeColor:(UIColor *)strokeColor
                                  lineWidth:(CGFloat)lineWidth
                                  duration:(CFTimeInterval)duration
                                    toView:(UIView *)view;
@end
