//
//  SWRefreshComponent.h
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import <UIKit/UIKit.h>

/**<刷新控件的状态*/
typedef NS_ENUM(NSUInteger, SWRefreshState) {
    SWRefreshStateIdle = 1,     /**<普通的闲置状态*/
    SWRefreshStatePulling,      /**<松开就可以进行刷新的状态*/
    SWRefreshStateRefreshing,   /**<正在刷新的状态*/
    SWRefreshStateWillRefresh,  /**<即将刷新的状态*/
    SWRefreshStateNoMoreData    /**<所有数据加载完毕，没有更多的数据了*/
};

typedef void (^SWRefreshComponentRefreshingBlock)();    /**<进入刷新状态的回调*/

/**<刷新空间的基类*/
@interface SWRefreshComponent : UIView
{
    UIEdgeInsets _scrollViewOriginalInset;  /**<记录scrollView刚开始的inset*/
    __weak UIScrollView *_scrollView;       /**<父控件*/
}

#pragma mark - 刷新回调
@property (copy, nonatomic) SWRefreshComponentRefreshingBlock refreshingBlock;/**<正在刷新的回调*/
@property (weak, nonatomic) id refreshingTarget;/**<回调对象*/
@property (assign, nonatomic) SEL refreshingAction;/**<回调方法*/

- (void)setrefreshingTarget:(id)target refreshingAction:(SEL)action;    /**<设置回调对象和回调方法*/
- (void)executeRefreshingCallBack;  /**<触发回调（交给子类去调用）*/

#pragma mark - 刷新状态控制
@property (assign, nonatomic) SWRefreshState state; /**<刷新状态 一般交给子类内部实现*/

- (void)beginRefreshing;    /**<进入刷新状态*/
- (void)endRefreshing;      /**<结束刷新状态*/
- (BOOL)isRefreshing;       /**<是否正在刷新*/

#pragma mark - 交给子类去访问
@property (assign, nonatomic, readonly) UIEdgeInsets scrollViewOriginInset;/**<记录scrollView刚开始的inset*/
@property (weak, nonatomic, readonly) UIScrollView *scrollView;/**<父控件*/

#pragma mark - 交给子类们去实现
- (void)prepare NS_REQUIRES_SUPER;/**<初始化*/
- (void)placeSubviews NS_REQUIRES_SUPER;/**<摆放子控件frame*/

/**<当scrollView的contentOffset发生改变的时候调用*/
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/**<当scrollView的contentSize发生改变的时候调用*/
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/**<当scrollView的拖拽状态发生改变的时候调用*/
- (void)scrollViewContentPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

#pragma mark - 其他
@property (assign, nonatomic) CGFloat pullingPercent;/**<拖拽的百分比（交给子类重写）*/
@property (assign, nonatomic, getter=isAutomaticallyChangeAlpha) BOOL automaticallyChangeAlpha;/**<根据拖拽比例自动切换透明度*/

@end

#pragma mark - 创建label
@interface UILabel (SWRefresh)

+ (instancetype)label;

@end
