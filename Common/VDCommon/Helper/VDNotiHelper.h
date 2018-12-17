//
//  VDNotiHelper.h
//  Common
//
//  Created by volientDuan on 2018/12/17.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface VDNotiHelper: NSObject
@property (nonatomic, copy)NSMutableDictionary *notiBlockDic;

+ (void)postNotiWithName:(NSNotificationName)name object:(id)object;

- (void)addNotiWithName:(NSNotificationName)notiName block:(void (^)(id))block;
- (void)removeWithName:(NSNotificationName)name;
- (void)remove;

@end

@interface NSObject (VDNotiHelper)
- (void)vd_notiWithName:(NSNotificationName)name block:(void(^)(id info))block;

@end
