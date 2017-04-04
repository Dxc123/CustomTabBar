//
//  AppDelegate.m
//  UITabBarController
//
//  Created by 代星创 on 2017/2/28.
//  Copyright © 2017年 Dxc. All rights reserved.
//

#import "AppDelegate.h"
#import "XXTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  /*
   //系统自带UITabBarController
    // 初始化UITabBarController实例对象
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    // 创建子控制器
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];

    // 设置标题
    vc1.tabBarItem.title = @"微信";
    // 设置选中状态的图片(  默认是蓝色，为了显示图片本来的颜色 设置mode  vc2,vc3,c4类似如此 )
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    // 设置未选中状态的图片
    vc1.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 未选中状态下文字颜色（vc2,vc3,c4类似如此）
    [vc1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    // 选中状态下的文字颜色
    [vc1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
//    // 设置右上角显示数字(例如: 未读消息数目)
//    vc1.tabBarItem.badgeValue = @"100";
//    // 右上角数字背景色
//    vc1.tabBarItem.badgeColor = [UIColor greenColor];
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    vc2.tabBarItem.title = @"联系人";
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tabbar_subscription_active"];
    vc2.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_subscription"] ;
    
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor cyanColor];
    vc3.tabBarItem.title = @"发现";
    vc3.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_notification"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tabbar_notification_active"];
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor whiteColor];
    vc4.tabBarItem.title = @"我";
    vc4.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_me"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tabbar_me_active"];
    
    
    // 添加子视图到tabbar
    tabBar.viewControllers = @[vc1, vc2, vc3, vc4];
    
    // 设置为window跟视图
    self.window.rootViewController = tabBar;

*/
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    XXTabBarViewController *tabBar=[[XXTabBarViewController alloc] init];
//    tabBar.view.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=tabBar;
    
    return YES;
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
