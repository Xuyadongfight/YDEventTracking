//
//  UIControl+MethodSwizzing.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "UIControl+MethodSwizzing.h"
#import <objc/runtime.h>
#import "YDRunTimeTool.h"


@implementation UIControl (MethodSwizzing)

- (void)YD_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if ([self isMemberOfClass:[UIButton class]]){
        self.pickCount += 1;
        NSDictionary *dic = @{@"action":NSStringFromSelector(action),
                              @"self":NSStringFromClass([self class]),
                              @"target":NSStringFromClass([target class]),
                              @"touchCount":[NSNumber numberWithInteger:self.pickCount]
        };
        NSMapTable *countMap = [YDRunTimeTool countMap];
        [countMap setObject:dic forKey: [NSString stringWithFormat:@"%p",self]];
    }
    [self YD_sendAction:action to:target forEvent:event];
    
}



static NSString * keyOfPickCount = @"aaaa";
- (void)setPickCount:(NSInteger)pickCount{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfPickCount), [NSNumber numberWithInteger:pickCount], OBJC_ASSOCIATION_RETAIN);
}
-(NSInteger)pickCount{
    NSNumber *temp = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(keyOfPickCount));
    return [temp unsignedIntegerValue];
}

- (void)dealloc
{
    if ([self isMemberOfClass:[UIButton class]]){
        NSString *pointerKey = [NSString stringWithFormat:@"%p",self];
        NSMapTable * map = [YDRunTimeTool countMap];
        NSDictionary *dic = [map objectForKey:pointerKey];
        [map removeObjectForKey:pointerKey];
        NSLog(@"dic = %@",dic);
    }
}
@end
