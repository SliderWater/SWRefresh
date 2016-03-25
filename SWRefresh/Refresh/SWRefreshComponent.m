//
//  SWRefreshComponent.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "SWRefreshComponent.h"
#import "UIView+SWFrame.h"

@interface SWRefreshComponent ()

@property (strong, nonatomic) UIPanGestureRecognizer *pan;

@end

@implementation SWRefreshComponent

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //准备工作
        [self prepare];
        
        //默认是普通状态
        self.state = SWRefreshStateIdle;
    }
    return self;
}

- (void)prepare
{
    //基本属性
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self placeSubviews];
}

- (void)placeSubviews
{
    //留给子类重写
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    //如果不是UIScrollView，不做任何事情
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) {
        return;
    }
    
    //旧的父控件移除监听
    [self removeObservers];
    
    if (newSuperview) {
        //设置宽度
        self.SWSizeWidth = newSuperview.SWSizeWidth;
        //设置位置
        self.SWOriginX = 0;
        
        //记录UIScrollView
        _scrollView = (UIScrollView *)newSuperview;
        //设置永远支持垂直弹簧效果
        _scrollView.alwaysBounceVertical = YES;
        //记录UIScrollView最开始的contentInset
        _scrollViewOriginalInset = _scrollView.contentInset;
        
        //添加监听
        [self addObservers];
    }
}



#pragma mark - KVO监听
- (void)addObservers
{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
}

- (void)removeObservers
{
    self.pan = nil;
}
     
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
}

















@end
