//
//  AppDelegate.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <objc/runtime.h>
#import "YDRunTimeTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil) {
        NSLog(@"change = %@",change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
