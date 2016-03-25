//
//  UIViewController+Example.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "UIViewController+Example.h"
#import <objc/runtime.h>

@implementation UIViewController (Example)

#pragma mark - swizzle

+ (void)load {
    
    SEL originalSelector = NSSelectorFromString(@"dealloc");
    SEL swizzledSelector = NSSelectorFromString(@"deallocSwizzle");
    
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
    
    BOOL didAddMethod = class_addMethod([self class], originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod([self class], swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)deallocSwizzle {
    NSLog(@"%@被销毁了", self);
    [self deallocSwizzle];
}

static char MethodKey;
- (void)setMethod:(NSString *)method {
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)method {
    return objc_getAssociatedObject(self, &MethodKey);
}

@end
