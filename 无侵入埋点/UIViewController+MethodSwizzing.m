//
//  UIViewController+MethodSwizzing.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "UIViewController+MethodSwizzing.h"
#import <objc/runtime.h>


@implementation UIViewController (MethodSwizzing)
+ (void)load{
    SEL selAppearOrigin = @selector(viewDidAppear:);
    SEL selAppearNew = @selector(YD_viewDidAppear:);
    [self changeMethod:selAppearOrigin withNew:selAppearNew];
    
    SEL selDisAppearOrigin = @selector(viewDidDisappear:);
    SEL selDisAppearNew = @selector(YD_viewDidDisappear:);
    [self changeMethod:selDisAppearOrigin withNew:selDisAppearNew];
}

+(void)changeMethod:(SEL)originSel withNew:(SEL)newSel{
    Method mAppearOrigin = class_getInstanceMethod([UIViewController class], originSel);
    Method mAppearNew = class_getInstanceMethod([UIViewController class], newSel);
    
    BOOL addMethod = class_addMethod([UIViewController class], originSel, method_getImplementation(class_getInstanceMethod([UIViewController class], originSel)), method_getTypeEncoding(mAppearNew));
    if (addMethod){
        class_replaceMethod([UIViewController class], originSel, method_getImplementation(mAppearNew), method_getTypeEncoding(mAppearNew));
    }else{
        method_exchangeImplementations(mAppearOrigin, mAppearNew);
    }
}


- (void)YD_viewDidAppear:(BOOL)animated{
    NSLog(@"%@我来了",self);
    [self setStart:[NSDate date]];
    [self YD_viewDidAppear:animated];
}
- (void)YD_viewDidDisappear:(BOOL)animated{
    [self setEnd:[NSDate date]];
    NSLog(@"%@我走了 呆了%f",self,[self getStandingTime]);
    [self YD_viewDidDisappear:animated];
}

static NSString * keyOfStartDate = @"aaaa";
static NSString * keyOfEndDate = @"bbbb";
- (void)setStart:(NSDate *)start{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfStartDate), start, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDate *)start{
   return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfStartDate));
}
- (void)setEnd:(NSDate *)end{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfEndDate), end, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDate *)end{
   return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfEndDate));
}

- (NSTimeInterval)getStandingTime{
    NSDate *start = [self start];
    NSDate *end = [self end];
    NSTimeInterval temp = [end timeIntervalSinceDate:start];
    return temp;
}
@end
