//
//  ZGWeiboTableView.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWeiboTableView.h"
#import "ZGWeiboContentCell.h"

@implementation ZGWeiboTableView

///允许同时识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//        NSLog(@"ffffTable gggggg ");
    
    // 512 是 可以水平滑动的scrollView
    if (otherGestureRecognizer.view.tag == 512) {
        return NO;
    }
    return YES;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *v = [super hitTest:point withEvent:event];
    if (v == self.tableHeaderView) {
        self.contentCell.contentScrollView.scrollEnabled = NO;
        return self.contentCell.curTableView;
    }
    return v;
}


@end
