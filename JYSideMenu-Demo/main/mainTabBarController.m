//
//  mainTabBarController.m
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/26.
//  Copyright (c) 2015年 demo. All rights reserved.
//

#import "mainTabBarController.h"
#import "MenuViewController.h"
#import "AppDelegate.h"

@implementation mainTabBarController 

- (void)viewDidLoad {
    [super viewDidLoad] ;
    self.view.backgroundColor = [UIColor purpleColor] ;
    self.view.frame = [UIScreen mainScreen].bounds ;
    [self addAllChildViewController] ;
    self.delegate = self ;
}

- (void)addAllChildViewController {
    [self addChildViewController:@"BaseTableViewController" title:@"话题" imageName:nil LeftBack : YES] ;
    [self addChildViewController:@"BaseTableViewController" title:@"圈子" imageName:nil LeftBack : NO] ;
    [self addChildViewController:@"BaseTableViewController" title:@"学长" imageName:nil  LeftBack : NO] ;
    [self addChildViewController:@"BaseTableViewController" title:@"我" imageName:nil  LeftBack : NO] ;
}

- (void) addChildViewController : (NSString *) name title : (NSString *) title imageName : (NSString *) imageName LeftBack : (BOOL) left {
    UITableViewController *vc = [[NSClassFromString(name) alloc ] initWithStyle:UITableViewStylePlain] ;
    self.tabBar.tintColor = [UIColor orangeColor] ;
    vc.title = title ;
//    vc.tabBarItem.image = [UIImage imageNamed:imageName] ;
//    NSString * hImageName = [NSString stringWithFormat:@"%@_highlighted" , imageName] ;
//    vc.tabBarItem.selectedImage = [UIImage imageNamed:hImageName] ;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc] ;
    if (left) {
        [self setLeftBack:vc] ;
    }
    
    [self addChildViewController:nav] ;
}

- (void) setLeftBack : (UIViewController*) vc {
     vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:0 target:self action:@selector(leftClick)] ;
}

- (void) leftClick {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.mainViewC changeViewController] ;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0) {
    // 如果重复点击不响应 , 防止话题出现回弹
    return  tabBarController.selectedViewController != viewController ;
}

// 选中后是否滚动
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.mainViewC setScrollEnabled: tabBarController.selectedIndex == 0] ;
}

// model新的控制器
- (void) modelViewController : (UIViewController *) ViewController title: (NSString *) title{
    [self leftClick] ;
    UINavigationController *nav =(UINavigationController*) self.viewControllers.firstObject ;
    NSArray *titleArray = [nav.viewControllers valueForKey:@"title"] ;
    NSUInteger index = [titleArray indexOfObject:title] ;
     NSLog(@"%tu  %@" , index , titleArray) ;
    if (index > 100) {
        [nav pushViewController:ViewController animated:NO] ;
        [self setLeftBack:ViewController];
        ViewController.title = title ;
        return ;
    }
    [nav popToViewController:[nav.viewControllers objectAtIndex:index] animated:NO] ;

}

@end
