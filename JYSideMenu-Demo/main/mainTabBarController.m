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
        vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:0 target:self action:@selector(leftClick)] ;
    }
    
    [self addChildViewController:nav] ;
}

- (void) leftClick {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.mainViewC changeViewController] ;
}

@end
