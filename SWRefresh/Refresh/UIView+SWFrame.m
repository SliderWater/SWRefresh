//
//  UIView+SWFrame.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "UIView+SWFrame.h"

@implementation UIView (SWFrame)

- (void)setSWOriginX:(CGFloat)SWOriginX
{
    CGRect frame = self.frame;
    frame.origin.x = SWOriginX;
    self.frame = frame;
}

- (CGFloat)SWOriginX
{
    return self.frame.origin.x;
}

- (void)setSWOriginY:(CGFloat)SWOriginY
{
    CGRect frame = self.frame;
    frame.origin.y = SWOriginY;
    self.frame = frame;
}

- (CGFloat)SWOriginY
{
    return self.frame.origin.y;
}

- (void)setSWSizeWidth:(CGFloat)SWSizeWidth
{
    CGRect frame = self.frame;
    frame.size.width = SWSizeWidth;
    self.frame = frame;
}

- (CGFloat)SWSizeWidth
{
    return self.frame.size.width;
}

- (void)setSWSizeHeight:(CGFloat)SWSizeHeight
{
    CGRect frame = self.frame;
    frame.size.height = SWSizeHeight;
    self.frame = frame;
}

- (CGFloat)SWSizeHeight
{
    return self.frame.size.height;
}

- (void)setSWSize:(CGSize)SWSize
{
    CGRect frame = self.frame;
    frame.size = SWSize;
    self.frame = frame;
}

- (CGSize)SWSize
{
    return self.frame.size;
}

- (void)setSWOrigin:(CGPoint)SWOrigin
{
    CGRect frame = self.frame;
    frame.origin = SWOrigin;
    self.frame = frame;
}

- (CGPoint)SWOrigin
{
    return self.frame.origin;
}





@end
