//
//  AppDelegate.m
//  3DTouch
//
//  Created by X on 2017/9/23.
//  Copyright © 2017年 ~X~. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //-- 代码添加3Dtouch
    [self setupShortItems];
   
    
    
    
    
    
    
    
    
    
    return YES;
}

/**
 *  代码设置   添加3DTouch的item
 */
- (void)setupShortItems
{
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"item1" localizedTitle:@"Item1" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd]  userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"item2" localizedTitle:@"Item2" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation]  userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
}


/**
 *  如果用户通过点击主屏幕上的3DTouch快捷按钮进入应用程序会来到这个方法
 */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{

    //-- 1 如果是用代码添加3DTouch的话 可以通过添加shortcutItem的type属性值来判断用户点击那个按钮，然后执行你自定义操作
    
    //-- 2 如果是通过在plist文件中设置添加3DTouch，可以通过UIApplicationShortcutItemType的值来判断用户点击那个按钮，然后执行你自定义操作
    
    NSLog(@"%@",shortcutItem.type);
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
