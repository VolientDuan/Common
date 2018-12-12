//
//  NSMutableAttributedString+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "NSMutableAttributedString+VDCommon.h"

@implementation NSMutableAttributedString (VDCommon)

- (NSMutableAttributedString *)vd_setColor:(UIColor *)color range:(NSRange)range{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    return self;
}
- (NSMutableAttributedString *)vd_setFont:(UIFont *)font range:(NSRange)range{
    [self addAttribute:NSFontAttributeName value:font range:range];
    return self;
}
- (NSMutableAttributedString *)vd_setUnderline:(NSRange)range{
    [self addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];
    return self;
}

@end
