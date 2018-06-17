//
//  ViewController.m
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGHomePageHorizontalViewController.h"
#import "ZGWeiboHomePageController.h"

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

    // 样例
    UIButton *weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weiboBtn.frame = CGRectMake(100, 300, 100, 100);
    weiboBtn.backgroundColor = [UIColor purpleColor];
    [weiboBtn setTitle:@"weibo" forState:UIControlStateNormal];
    [weiboBtn addTarget:self action:@selector(didWeiboBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiboBtn];

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

- (void)didWeiboBtn:(UIButton *)btn
{
    ZGWeiboHomePageController *weiboVC = [[ZGWeiboHomePageController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:weiboVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
