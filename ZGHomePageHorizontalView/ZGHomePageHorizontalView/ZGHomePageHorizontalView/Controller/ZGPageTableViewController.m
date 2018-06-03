//
//  MYQPageTableViewController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2017/7/21.
//  Copyright © 2017年 Zong. All rights reserved.
//

#import "ZGPageTableViewController.h"
#import "ZGHomePageHorizontalViewController.h"

@interface ZGPageTableViewController ()

@property (nonatomic, assign) BOOL willDecelerate;

@end

@implementation ZGPageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - 
- (instancetype)initWithContainVC:(ZGHomePageHorizontalViewController *)contianVC
{
    if (self = [super init]) {
        self.containVC = contianVC;
    }
    return self;
}


#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat containScrollViewY = self.containVC.tableView.contentOffset.y;
    
    if (scrollView.contentOffset.y > 0) { // 上拉
        
        // 处理父scrollView下拉，上拉没有减速效果
        if (containScrollViewY > -64.0) {
            self.tableView.contentInset = UIEdgeInsetsMake(3, 0, 0, 0);
        }
        
        
//        NSLog(@"scrollView contentOffset ++++++++ %@ ",NSStringFromCGPoint(scrollView.contentOffset));
        if (containScrollViewY < ZGHomePageHorizontalTopViewHeight - 64.0) {
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += scrollView.contentOffset.y;
            self.containVC.tableView.contentOffset = tmpContentOffset;
            
            self.tableView.contentOffset = CGPointMake(0, 0);
        }
        
    }else { // 下拉
        
//        NSLog(@"scrollView contentOffset -------- %@ ",NSStringFromCGPoint(scrollView.contentOffset));
        // 处理父scrollView下拉，上拉没有减速效果
        self.tableView.contentInset = UIEdgeInsetsMake(3, 0, 0, 0);
//        if (self.containVC.tableView.contentOffset.y < -64.0) {
//            self.tableView.contentInset = UIEdgeInsetsMake(1, 0, 0, 0);
//        }
        
        CGFloat screenBottomY = - 64 - 1000;
        if ( containScrollViewY >= screenBottomY) { // -500 数值不重要，重要是目的
            
            CGFloat offsetY = scrollView.contentOffset.y;
            CGFloat deceleratY = -128; // 自己实现-64 ~ -18 为减速区间
            if (containScrollViewY < deceleratY) {
                if (offsetY < -0.5) {
                    offsetY =  -0.5;
                }
            }else if (containScrollViewY < -64) {
                if (scrollView.decelerating == YES) {
                    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                }else {
                    if (offsetY < -5) {
                        offsetY =  -5;
                    }
                }
            }
            
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += offsetY;
            self.containVC.tableView.contentOffset = tmpContentOffset;
        }
        
        self.tableView.contentOffset = CGPointMake(0, 0);

    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(self.containVC.tableView.contentOffset.y < -64.0)
    {
        [self.containVC.tableView setContentOffset:CGPointMake(0, -64.0) animated:YES];
    }else if (self.containVC.tableView.contentOffset.y > ZGHomePageHorizontalTopViewHeight - 64.0){
        [self.containVC.tableView setContentOffset:CGPointMake(0, ZGHomePageHorizontalTopViewHeight - 64.0) animated:YES];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.containVC.tableView.contentOffset.y < -64) {
        scrollView.decelerationRate = 0;
    }else {
        scrollView.decelerationRate = 1;
    }
    
    if(!decelerate)
    {
        if(self.containVC.tableView.contentOffset.y < -64.0)
        {
            [self.containVC.tableView setContentOffset:CGPointMake(0, -64.0) animated:YES];
        }else if (self.containVC.tableView.contentOffset.y > ZGHomePageHorizontalTopViewHeight - 64.0){
            [self.containVC.tableView setContentOffset:CGPointMake(0, ZGHomePageHorizontalTopViewHeight - 64.0) animated:YES];
        }
    }
    
    
}


@end
