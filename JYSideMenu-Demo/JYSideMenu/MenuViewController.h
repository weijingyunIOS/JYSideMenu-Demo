//
//  MenuViewController.h
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/26.
//  Copyright (c) 2015年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

- (void) changeViewController ;
- (void) setScrollEnabled : (BOOL) enabled ;
- (instancetype) initWithLeftViewController : (UIViewController *) LeftController MenuViewController : (UIViewController *) menuController ;

@end
