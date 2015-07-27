//
//  MenuViewController.m
//  JYSideMenu-Demo
//
//  Created by wei_jingyun on 15/7/26.
//  Copyright (c) 2015年 demo. All rights reserved.
//

#import "MenuViewController.h"
#define ScreenSize [UIScreen mainScreen].bounds.size
@interface MenuViewController () <UIScrollViewDelegate>

@property (weak , nonatomic) UIScrollView * scrollView ;
@property (weak , nonatomic) UIView * maskView ;

@end


@implementation MenuViewController

- (void)loadView {
    self.view  = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds] ;
    self.scrollView = (UIScrollView *)self.view ;
}

- (void)viewDidLoad {
    [super viewDidLoad] ;
    CGSize size = [UIScreen mainScreen].bounds.size ;
    self.scrollView.backgroundColor = [UIColor blueColor] ;
    self.leftView.frame = CGRectMake(0, 0, size.width * 0.8 , size.height) ;
    self.menuView.frame = CGRectMake(size.width * 0.8, 0, size.width, size.height) ;
    self.maskView.frame = self.leftView.frame ;
    [self prepareScrollView] ;
    [self test] ;
}

- (void) prepareScrollView {
    CGSize size = [UIScreen mainScreen].bounds.size ;
    self.scrollView.contentSize = CGSizeMake(size.width * 1.8 , size.height) ;
    self.scrollView.contentOffset = CGPointMake(size.width * 0.8 , 0) ;
    self.scrollView.bounces = NO ;
    self.scrollView.showsHorizontalScrollIndicator = NO ;
    self.scrollView.pagingEnabled = YES ;
    self.scrollView.delegate = self ;
}

#pragma mark - 滚动的代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.leftView bringSubviewToFront:self.maskView] ;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.leftView.layer.anchorPoint = CGPointZero ;
    self.leftView.layer.position = CGPointMake(scrollView.contentOffset.x *0.65 , 0);
        CGFloat aa =  scrollView.contentOffset.x / ([UIScreen mainScreen].bounds.size.width * 0.8);
     self.maskView.alpha = aa - 0.1  ;
}

#pragma mark - 切换视图
- (void) changeViewController {
    CGFloat offSet = self.scrollView.contentOffset.x == 0 ? ScreenSize.width * 0.8 : 0 ;
    [self.leftView bringSubviewToFront:self.maskView] ;
    [self scrollViewDidScroll:self.scrollView ] ;
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0.5 ;
        self.scrollView.contentOffset = CGPointMake(offSet, 0) ;
    }] ;
}

#pragma mark - 测试
- (void) test {
    UIImageView * imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"11-1"] ] ;
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.clipsToBounds = YES ;
    imageView.frame = self.leftView.frame ;
    [self.leftView addSubview:imageView ] ;
}



#pragma mark - 懒加载
- (UIView *)menuView {
    if (!_menuView) {
        UIView * view = [[UIView alloc] init] ;
        [self.scrollView addSubview:view ] ;
        _menuView = view ;
    }
    return _menuView ;
}

- (UIView *)leftView {
    if (!_leftView) {
        UIView * view = [[UIView alloc] init] ;
        [self.scrollView addSubview:view ] ;
        _leftView = view ;
    }
    return _leftView ;
}

- (UIView *)maskView {
    if (!_maskView) {
        UIView * view = [[UIView alloc] init] ;
        [self.leftView addSubview:view ] ;
        view.backgroundColor = [UIColor blackColor] ;
        _maskView = view ;
    }
    return _maskView ;
}


@end
