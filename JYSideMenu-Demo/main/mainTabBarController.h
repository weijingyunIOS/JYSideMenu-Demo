//
//  mainTabBarController.h
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/26.
//  Copyright (c) 2015年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainTabBarController : UITabBarController <UITabBarControllerDelegate>
- (void) modelViewController : (UIViewController *) ViewController title: (NSString *) title ;
@end
