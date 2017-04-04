//
//  XXTabBar.h
//  UITabBarController
//
//  Created by 代星创 on 2017/3/8.
//  Copyright © 2017年 Dxc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXTabBar;
@protocol XXTabBarDelegate <UITabBarDelegate>

@required
-(void)tabBarDidClickPlusButton:(XXTabBar *)tabBar;
@end
@interface XXTabBar : UITabBar
@property (nonatomic,weak)id <XXTabBarDelegate>delegate;
@end
