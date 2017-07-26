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
    if (scrollView.contentOffset.y > 0) { // 上拉
        
        // 处理父scrollView下拉，上拉没有减速效果
        if (self.containVC.tableView.contentOffset.y > -64.0) {
            self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
        }
        
        
//        NSLog(@"scrollView contentOffset ++++++++ %@ ",NSStringFromCGPoint(scrollView.contentOffset));
        if (self.containVC.tableView.contentOffset.y < ZGHomePageHorizontalTopViewHeight - 64.0) {
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += scrollView.contentOffset.y;
            self.containVC.tableView.contentOffset = tmpContentOffset;
            
            self.tableView.contentOffset = CGPointMake(0, 0);
        }
        
    }else { // 下拉
        
//        NSLog(@"scrollView contentOffset -------- %@ ",NSStringFromCGPoint(scrollView.contentOffset));
        // 处理父scrollView下拉，上拉没有减速效果
        if (self.containVC.tableView.contentOffset.y < -64.0) {
            self.tableView.contentInset = UIEdgeInsetsMake(1, 0, 0, 0);
        }
        
        if ( self.containVC.tableView.contentOffset.y < -64.0) {
            
            
            CGFloat offsetY = scrollView.contentOffset.y;
            if (scrollView.decelerating == YES) {
                if (offsetY < -5) {
                    offsetY =  -5;
                }
            }
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += offsetY;
            self.containVC.tableView.contentOffset = tmpContentOffset;
            
            self.tableView.contentOffset = CGPointMake(0, 0);

            
        }else if ( self.containVC.tableView.contentOffset.y >= - 64 - 60) {
            
            CGFloat offsetY = scrollView.contentOffset.y;
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += offsetY;
            self.containVC.tableView.contentOffset = tmpContentOffset;
            
            self.tableView.contentOffset = CGPointMake(0, 0);
        }
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

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    ;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
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
