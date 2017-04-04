//
//  XXPublishViewController.m
//  UITabBarController
//
//  Created by 代星创 on 2017/3/9.
//  Copyright © 2017年 Dxc. All rights reserved.
//

#import "XXPublishViewController.h"

@interface XXPublishViewController ()

@end

@implementation XXPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view .backgroundColor=[UIColor cyanColor];
    self.navigationItem.title = @"发布";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    
    
  }

- (void)pop {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
