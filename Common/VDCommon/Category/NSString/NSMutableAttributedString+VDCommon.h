//
//  NSMutableAttributedString+VDCommon.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//NSFontAttributeName               字号 UIFont
//NSParagraphStyleAttributeName     段落样式  NSParagraphStyle
//NSForegroundColorAttributeName    前景色   UIColor
//NSBackgroundColorAttributeName    背景色   UIColor
//NSObliquenessAttributeName        字体倾斜     NSNumber
//NSExpansionAttributeName          字体加粗     NSNumber  比例 0就是不变 1增加一倍
//NSKernAttributeName               字间距   CGFloat
//NSUnderlineStyleAttributeName     下划线     1或0
//NSUnderlineColorAttributeName     下划线颜色

//NSStrikethroughStyleAttributeName 删除线   NSUnderlineStyleNone 不设置删除线    NSUnderlineStyleSingle 设置删除线为细单实线 NSUnderlineStyleThick 设置删除线为粗单实线NSUnderlineStyleDouble 设置删除线为细双实线

//NSStrikethroughColorAttributeName 某种颜色
//NSStrokeColorAttributeName        same as ForegroundColor
//NSStrokeWidthAttributeName        CGFloat
//NSLigatureAttributeName           连笔字取值为NSNumber对象
//NSShadowAttributeName             阴影    NSShawdow
//NSTextEffectAttributeName         设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
//NSAttachmentAttributeName         NSTextAttachment  设置文本附件,常用插入图片
//NSLinkAttributeName               链接  NSURL (preferred) or NSString
//NSBaselineOffsetAttributeName     基准线偏移   NSNumber
//NSWritingDirectionAttributeName   文字方向     @[@(1),@(2)]  分别代表不同的文字出现方向等等，我想你一定用不到它 - -
//NSVerticalGlyphFormAttributeName  水平或者竖直文本  1竖直 0水平 在iOS没卵用，不支持竖版

@interface NSMutableAttributedString (VDCommon)

- (NSMutableAttributedString *)vd_setColor:(UIColor *)color range:(NSRange)range;
- (NSMutableAttributedString *)vd_setFont:(UIFont *)font range:(NSRange)range;
- (NSMutableAttributedString *)vd_setUnderline:(NSRange)range;

@end
