//
//  LeftViewController.m
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/28.
//  Copyright © 2015年 demo. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
@interface LeftViewController ()
@property (weak , nonatomic) UIImageView *imageView ;
@end

@implementation LeftViewController
- (void)viewDidLoad {
    UIImageView * imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"ww"]] ;
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.clipsToBounds = YES ;
    self.imageView = imageView ;
    [self.view addSubview:imageView ] ;
    for (int i = 0; i < 7 ; i ++) {
        UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [but addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside] ;
        but.frame = CGRectMake(100, 50 + i * 50, 100, 44) ;
        but.backgroundColor = [UIColor orangeColor] ;
        NSString *str = (i != 0) ? [NSString stringWithFormat:@"话题%d" , i] : @"话题" ;
        [but setTitle:str forState:UIControlStateNormal] ;
        [self.view addSubview:but] ;
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated] ;
    self.imageView.frame = self.view.frame ;
}

- (void) butClick:(UIButton*)but {
    NSLog(@"%s" , __func__) ;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIViewController *vc = [[UIViewController alloc] init] ;
    vc.view.backgroundColor = [UIColor orangeColor] ;
    [app.mainTab modelViewController:vc title:[but titleForState:UIControlStateNormal]] ;
}



@end
