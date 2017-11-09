//
//  AppDelegate+Extension.m
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import "ViewController.h"

@implementation AppDelegate (Extension)

- (void)my_buildAppDeleagteState {
    // 设置window启动
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds ];
    self.window.backgroundColor = [UIColor blackColor];
    ViewController *testVC = [[ViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:testVC];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
}






@end
