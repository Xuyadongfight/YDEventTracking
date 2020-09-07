//
//  YDRunTimeTool.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "YDRunTimeTool.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIControl+MethodSwizzing.m"

static NSMapTable *count_map;

@implementation YDRunTimeTool

+(NSMapTable *)countMap{
    return count_map;
}

+ (void)load{
    NSLog(@"tool");
    SEL selOrigin = @selector(sendAction:to:forEvent:);
    SEL selNew = @selector(YD_sendAction:to:forEvent:);
    [self changeMethod:selOrigin withNew:selNew];
    count_map = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsStrongMemory];
}
+(void)changeMethod:(SEL)originSel withNew:(SEL)newSel{
    Method mOld = class_getInstanceMethod([UIControl class], originSel);
    Method mNew = class_getInstanceMethod([UIControl class], newSel);
    method_exchangeImplementations(mOld, mNew);
}


@end
