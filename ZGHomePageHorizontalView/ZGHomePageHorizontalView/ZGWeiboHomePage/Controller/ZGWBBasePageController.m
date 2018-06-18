//
//  ZGWBBasePageController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWBBasePageController.h"


NSString *const ZGWeiboPageTableCanScrollNotify = @"ZGWeiboPageTableCanScrollNotify";
NSString *const ZGWeiboTableCanScrollNotify = @"ZGWeiboTableCanScrollNotify";


@interface ZGWBBasePageController () <UIScrollViewDelegate>

@end

@implementation ZGWBBasePageController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCanScroll) name:ZGWeiboPageTableCanScrollNotify object:nil];
}

#pragma mark - notify
- (void)didCanScroll
{
    self.canScroll = YES;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//            NSLog(@"ppppppppppppppp");
    if (scrollView.contentOffset.y <= 0) {
        // 自己不可以滚动
        self.canScroll = NO;
        [scrollView setContentOffset:CGPointZero];
        // 主 table 可以滚动
        [[NSNotificationCenter defaultCenter] postNotificationName:ZGWeiboTableCanScrollNotify object:nil];
    }else {
        if (!self.canScroll) {
            [scrollView setContentOffset:CGPointZero];
        }
    }
    
}

@end
