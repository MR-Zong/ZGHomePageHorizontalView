//
//  ZGJapanController.m
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGJapanController.h"
#import "ZGHomePageHorizontalViewController.h"

@interface ZGJapanController ()

@end

@implementation ZGJapanController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"faxianCellReuserdIDJapan"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"faxianCellReuserdIDJapan"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Japan - %zd",indexPath.row];
    return cell;
    
}

- (CGFloat)totalHeight
{
    return self.tableView.contentSize.height;
}



#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        
        // 处理父scrollView下拉，上拉没有减速效果
        if (self.containVC.tableView.contentOffset.y > -64.0) {
            self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
        }
        
        
//        NSLog(@"scrollView contentOffset %@ ",NSStringFromCGPoint(scrollView.contentOffset));
        if (self.containVC.tableView.contentOffset.y < ZGHomePageHorizontalTopViewHeight) {
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += scrollView.contentOffset.y;
            self.containVC.tableView.contentOffset = tmpContentOffset;
            
            self.tableView.contentOffset = CGPointMake(0, 0);
        }
        
    }else {
        
        // 处理父scrollView下拉，上拉没有减速效果
        if (self.containVC.tableView.contentOffset.y < -64.0) {
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
        
        if (self.containVC.tableView.contentOffset.y >= - 64 - 60) {
            
            
            CGPoint tmpContentOffset = self.containVC.tableView.contentOffset;
            tmpContentOffset.y += scrollView.contentOffset.y;
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
    }else if (self.containVC.tableView.contentOffset.y > 144){
        [self.containVC.tableView setContentOffset:CGPointMake(0, ZGHomePageHorizontalTopViewHeight) animated:YES];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate)
    {
        if(self.containVC.tableView.contentOffset.y < -64.0)
        {
            [self.containVC.tableView setContentOffset:CGPointMake(0, -64.0) animated:YES];
        }else if (self.containVC.tableView.contentOffset.y > 144){
            [self.containVC.tableView setContentOffset:CGPointMake(0, ZGHomePageHorizontalTopViewHeight) animated:YES];
        }
    }
}


@end
