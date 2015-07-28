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
@property (weak , nonatomic) UIView * menuView ;
@property (weak , nonatomic) UIView * leftView ;

@end


@implementation MenuViewController

// 设置左右的控制器
- (instancetype) initWithLeftViewController:(UIViewController *)LeftController MenuViewController:(UIViewController *)menuController {
    if (self = [super init]) {
        NSAssert(LeftController != nil && menuController != nil, @"控制器不可为空") ;
        UIScrollView * scV = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds] ;
        self.scrollView = scV ;
        [self.view addSubview:scV] ;
        self.leftView = [self setViewController:LeftController] ;
        self.menuView = [self setViewController:menuController] ;
        [self setFrame] ;
    }
    return self ;
}

// 是否允许侧滑
- (void) setScrollEnabled : (BOOL) enabled {
    self.scrollView.scrollEnabled = enabled ;
}

// 设置控制器,返回引用的View
- (UIView*) setViewController : (UIViewController *) viewController {
    [self.scrollView addSubview:viewController.view] ;
    [self addChildViewController:viewController] ;
    return  viewController.view ;
}

// 设置Frame
- (void) setFrame {
    self.scrollView.backgroundColor = [UIColor blueColor] ;
    self.leftView.frame = CGRectMake(0, 0, ScreenSize.width * 0.8 , ScreenSize.height) ;
    self.menuView.frame = CGRectMake(ScreenSize.width * 0.8, 0, ScreenSize.width, ScreenSize.height) ;
    self.maskView.frame = self.leftView.frame ;
    [self prepareScrollView] ;
}

// 配置ScrollView
- (void) prepareScrollView {
    self.scrollView.contentSize = CGSizeMake(ScreenSize.width * 1.8 , ScreenSize.height) ;
    self.scrollView.contentOffset = CGPointMake(ScreenSize.width * 0.8 , 0) ;
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
    CGSize size = self.leftView.frame.size ;
    self.leftView.layer.position = CGPointMake(scrollView.contentOffset.x *0.65 + size.width * 0.5 , size.height * 0.5);
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
