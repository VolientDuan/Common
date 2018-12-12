//
//  UIView+VDCommon.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VDCommon)

#pragma mark [frame]

/**
 *  view的x(横)坐标
 */
@property (nonatomic, assign)CGFloat v_x;
/**
 *  view的y(纵)坐标
 */
@property (nonatomic, assign)CGFloat v_y;
/**
 *  view的宽度
 */
@property (nonatomic, assign)CGFloat v_w;
/**
 *  view的高度
 */
@property (nonatomic, assign)CGFloat v_h;
/**
 *  view的中心横坐标
 */
@property (nonatomic, assign)CGFloat v_centerX;
/**
 *  view的中心纵坐标
 */
@property (nonatomic, assign)CGFloat v_centerY;
/**
 *  view的上部
 */
@property (nonatomic, assign, readonly)CGFloat v_top;
/**
 *  view的左部
 */
@property (nonatomic, assign, readonly)CGFloat v_left;
/**
 *  view的底部
 */
@property (nonatomic, assign, readonly)CGFloat v_bottom;
/**
 *  view的右部
 */
@property (nonatomic, assign, readonly)CGFloat v_right;

/**
 *  view的size
 */
@property (nonatomic, assign)CGSize v_size;
/**
 *  view的origin
 */
@property (nonatomic, assign)CGPoint v_origin;


#pragma mark [layer]

/**
 *  view的圆角半径
 */
@property (nonatomic, assign)CGFloat v_cornerRadius;

/**
 获取渐变layer：注意frame问题
 
 @param colors 颜色组合 →
 @param frame 颜色覆盖位置
 @param isHorizontal 水平排列 or 竖直排列
 @return CAGradientLayer 渐变图层
 */
- (CAGradientLayer *)v_getColorsLayer:(NSArray *)colors frame:(CGRect)frame isHorizontal:(BOOL)isHorizontal;

/**
 清除渐变色
 */
- (void)v_clearColors;

/**
 设置渐变背景色：注意frame问题
 如果需要清除渐变背景色，设置nil即可
 */
@property (nonatomic, copy)NSArray<UIColor *> *v_backgroundColors;

@end

