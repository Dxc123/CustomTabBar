//
//  XXTabBar.m
//  UITabBarController
//
//  Created by 代星创 on 2017/3/8.
//  Copyright © 2017年 Dxc. All rights reserved.
//

#import "XXTabBar.h"
#import "UIView+Extension.h"
@interface XXTabBar ()
@property (nonatomic,strong)UIButton *publishButton;
@property (nonatomic, weak) UILabel *label;
@end
@implementation XXTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"account_highlight"] forState:UIControlStateHighlighted];
//        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        
//        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        
        [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.publishButton = plusBtn;
        [self addSubview:self.publishButton];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"发布";
        label.font = [UIFont systemFontOfSize:11];
        [label sizeToFit];
        label.textColor = [UIColor grayColor];
         self.label = label;
        [self addSubview:label];
        

    
    }
    return self;
    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    /****2.****/
//    self.publishButton.center.x = self.frame.size.width /2;//会报错，必须使用类扩展转换)
//    self.publishButton.center.y = self.frame.size.height /2;
    
    
    // 1.设置加号按钮的位置
    self.publishButton.centerX = self.width/2;
    self.publishButton.centerY = self.height/2 -20;
    
    self.label.centerX = self.publishButton.centerX;
    self.label.centerY = CGRectGetMaxY(self.publishButton.frame)+10;


    //2.设置其他tabbarButton的位置和尺寸
    CGFloat tabBarButtonW  = self.width / 5;//每一个按钮的宽度==tabbar的五分之一
    CGFloat tabbarButtonIndex = 0;
    
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
    
            // 设置x
            child.x = tabbarButtonIndex * tabBarButtonW;
            // 设置宽度
            child.width = tabBarButtonW;
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                //索引=2时跳过
            
                tabbarButtonIndex++;
            }

        }
    }
  
    

}

- (void)plusBtnClick

{
    NSLog(@"%s",__func__);
    // 通知代理
    if ( self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
        
    }
}


//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newPoint = [self convertPoint:point toView:self.publishButton];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.publishButton pointInside:newPoint withEvent:event]) {
            return self.publishButton;
        }else{
            //如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {
        //tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
