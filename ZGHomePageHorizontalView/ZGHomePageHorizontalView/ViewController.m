//
//  ViewController.m
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGHomePageHorizontalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 样例
    UIButton *homePageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    homePageBtn.frame = CGRectMake(100, 100, 100, 100);
    homePageBtn.backgroundColor = [UIColor purpleColor];
    [homePageBtn setTitle:@"homePage" forState:UIControlStateNormal];
    [homePageBtn addTarget:self action:@selector(didHomePageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homePageBtn];
    
}


#pragma mark - 
- (void)didHomePageBtn:(UIButton *)btn
{
    [self textHomePage];
}

- (void)textHomePage
{
    ZGHomePageHorizontalViewController *homePageVC = [[ZGHomePageHorizontalViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
