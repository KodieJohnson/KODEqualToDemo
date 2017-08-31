//
//  AppDelegate.m
//  KODEqualToDemo
//
//  Created by KODIE on 2017/8/31.
//  Copyright © 2017年 kodie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController: vc];
    _window.rootViewController = nav;
    [_window makeKeyAndVisible];
    return YES;
}

@end
