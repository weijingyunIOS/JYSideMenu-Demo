//
//  MenuViewController.h
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/26.
//  Copyright (c) 2015年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (weak , nonatomic) UIView * menuView ;
@property (weak , nonatomic) UIView * leftView ;
- (void) changeViewController ;
@end
