//
//  LeftViewController.m
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/28.
//  Copyright © 2015年 demo. All rights reserved.
//

#import "LeftViewController.h"
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
    UIButton * but = [UIButton buttonWithType:UIButtonTypeContactAdd] ;
    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside] ;
    but.frame = CGRectMake(100, 100, 37, 37) ;
    [self.view addSubview:but] ;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated] ;
    self.imageView.frame = self.view.frame ;
}

- (void) butClick {
    NSLog(@"%s" , __func__) ;
}



@end
