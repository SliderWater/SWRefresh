//
//  UIView+SWFrame.h
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWFrame)

@property (assign, nonatomic) CGFloat SWOriginX;
@property (assign, nonatomic) CGFloat SWOriginY;
@property (assign, nonatomic) CGFloat SWSizeWidth;
@property (assign, nonatomic) CGFloat SWSizeHeight;
@property (assign, nonatomic) CGSize  SWSize;
@property (assign, nonatomic) CGPoint SWOrigin;

@end
