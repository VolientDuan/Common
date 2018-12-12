//
//  NSString+VDCommon.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (VDCommon)

- (NSString *)vd_md5;

//是否为空
+ (BOOL)vd_isEmpty:(NSString *)string;

/**
 compare two version
 @param sourVersion *.*.*.*
 @param desVersion *.*.*.*
 @returns No,sourVersion is less than desVersion; YES, the statue is opposed
 */
+(BOOL)vd_compareVerison:(NSString *)sourVersion withDes:(NSString *)desVersion;

//当前字符串是否只包含空白字符和换行符
- (BOOL)vd_isWhitespaceAndNewlines;

//去除字符串前后的空白,不包含换行符
- (NSString *)vd_trim;
- (NSString *)vd_removeWhiteSpace;


//去除字符串中所有空白
- (NSString *)vd_removeNewLine;

//将字符串以URL格式编码
- (NSString *)vd_stringByUrlEncoding;

- (NSURL *)vd_encodeUrl;

/*!
 @brief     大写第一个字符
 @return    格式化后的字符串
 */
- (NSString *)vd_capitalize;

//以给定字符串开始,忽略大小写
- (BOOL)vd_startsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串开始
- (BOOL)vd_startsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;


//以给定字符串结束，忽略大小写
- (BOOL)vd_endsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串结尾
- (BOOL)vd_endsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//包含给定的字符串, 忽略大小写
- (BOOL)vd_containsString:(NSString *)str;
//以指定条件判断是否包含给定的字符串
- (BOOL)vd_containsString:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//判断字符串是否相同，忽略大小写
- (BOOL)vd_equalsString:(NSString *)str;


- (NSString *)vd_emjoiText;

// 是否带有表情府
- (BOOL)vd_isContainsEmoji;


@end
