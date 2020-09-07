//
//  UIControl+MethodSwizzing.h
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (MethodSwizzing)
@property(nonatomic,assign)NSInteger pickCount;
@end

NS_ASSUME_NONNULL_END
