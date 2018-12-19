//
//  FirstViewController.h
//  Common
//
//  Created by volientDuan on 2018/12/13.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController
@property (nonatomic, strong)NSString *firstTitle;
@property (nonatomic, copy)void (^block)(void);
@end
