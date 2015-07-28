//
//  LeftViewController.m
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/28.
//  Copyright © 2015年 demo. All rights reserved.
//

#import "LeftViewController.h"

@implementation LeftViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated] ;
    [self test] ;
}

- (void) test {
    UIImageView * imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"11-1"] ] ;
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.clipsToBounds = YES ;
    imageView.frame = self.view.frame ;
    [self.view addSubview:imageView ] ;
}

@end
