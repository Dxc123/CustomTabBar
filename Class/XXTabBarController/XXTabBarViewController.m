//
//  XXTabBarViewController.m
//  UITabBarController
//
//  Created by 代星创 on 2017/3/8.
//  Copyright © 2017年 Dxc. All rights reserved.
//

#import "XXTabBarViewController.h"
#import "XXBaseNavViewController.h"
#import "XXTabBar.h"
#import "XXHomeViewController.h"
#import "XXGradeViewController.h"
#import "XXFriendsViewController.h"
#import "XXMeViewController.h"
#import "XXPublishViewController.h"
@interface XXTabBarViewController ()<XXTabBarDelegate>

@end

@implementation XXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义tabBar（继承UITabBar）
   // 在TabBarController里设置子控制器的属性，并加载自定义的UITabBar
    [self setUpChildViewControllers];
    /**** 更换TabBar ****/
    [self setupTabBar];
}

/***  添加所有子控制器*/

-(void)setUpChildViewControllers{
    XXHomeViewController *homeVc=[[XXHomeViewController alloc] init];
    [self setUpOneChildViewController:homeVc image:[UIImage imageNamed:@"icon_home"]  selectedImage:[UIImage imageNamed:@"icon_home_active"]  title:@"咸鱼"];
    XXGradeViewController *gradeVC=[[XXGradeViewController alloc] init];
    [self setUpOneChildViewController:gradeVC image:[UIImage imageNamed:@"icon_fish"] selectedImage:[UIImage imageNamed:@"icon_fish_active"] title:@"鱼塘"];
    XXFriendsViewController *friendsVC=[[XXFriendsViewController alloc] init];
    [self setUpOneChildViewController:friendsVC image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_active"] title:@"消息"];
    XXMeViewController *meVC=[[XXMeViewController alloc] init];
    [self setUpOneChildViewController:meVC image:[UIImage imageNamed:@"icon_account"] selectedImage:[UIImage imageNamed:@"icon_account_active"] title:@"我的"];
    
}

/**添加一个子控制器的方法*/
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage  title:(NSString *)title{
    
    //设置tabBarItem的title
    viewController.tabBarItem.title=title;
    
    //    tabBarItem 的选中和不选中文字属性
    [viewController .tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [viewController .tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:215/255.0 green:111/255.0 blue:96/255.0 alpha:1.0]} forState:UIControlStateSelected];
    
    //    tabBarItem 的选中和不选中图片属性  并禁用图片默认的蓝色渲染
    [viewController.tabBarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewController.tabBarItem setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //navigationBar 的一些设置(最好在各自的子控制器设置所需的)也可以在XXBaseNavViewController统一设置
    //    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    //     viewController.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    //    [viewController.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
    //          NSForegroundColorAttributeName: [UIColor blackColor]}];
        viewController.navigationItem.title = title;
    
    XXBaseNavViewController *BaseNav=[[XXBaseNavViewController alloc] initWithRootViewController:viewController];
    [self addChildViewController:BaseNav];
    
}

/**
 *  KVC更换TabBar
 */// KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：
- (void)setupTabBar
{
    [self setValue:[[XXTabBar alloc] init] forKeyPath:@"tabBar"];
}


#pragma XXTabBarDelegate
/**
 *  加号按钮点击
 */
- (void)tabBarDidClickPlusButton:(XXTabBar *)tabBar

{
     NSLog(@"%s",__func__);
    XXPublishViewController *vc = [[XXPublishViewController alloc] init];
    XXBaseNavViewController *BaseNav=[[XXBaseNavViewController alloc] initWithRootViewController:vc];
    
    [self presentViewController:BaseNav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
