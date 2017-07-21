//
//  ZGHomePageViewController.m
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGHomePageHorizontalViewController.h"

#import "ZGJapanController.h"
#import "ZGAmericaController.h"
#import "ZGHomePageHorizontalCell.h"
#import "ZGHomePageHorizontalContainView.h"

#import "ZGTabSegmentView.h"

float const ZGHomePageHorizontalTopViewHeight = 144.0;

@interface ZGHomePageHorizontalViewController () <ZGTabSegmentViewDelegate,ZGHomePageHorizontalCellDelegate>

@property (nonatomic, strong) ZGHomePageHorizontalCell *homePageCell;
@property (nonatomic, strong) ZGJapanController *japanVC;
@property (nonatomic, strong) ZGAmericaController *americaVC;
@property (nonatomic, strong) ZGTabSegmentView *tabSegmentView;

@end

@implementation ZGHomePageHorizontalViewController


- (void)loadView
{
    self.view = [[ZGHomePageHorizontalContainView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"homePage";
    
    [self setupViews];
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, -10,0);
    _tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_tableView];
}

- (void)setupViews
{
    [self setupTableView];
    
    _tabSegmentView = [[ZGTabSegmentView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 44.0)];
    _tabSegmentView.delegate = self;
    
    _japanVC = [[ZGJapanController alloc] initWithContainVC:self];
    _americaVC = [[ZGAmericaController alloc] initWithContainVC:self];
    
    
    _homePageCell = [[ZGHomePageHorizontalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZGHomePageHorizontalCellReusedID];
    _homePageCell.delegate = self;
    [_homePageCell contentScrollViewAddSubView:self.japanVC.view];
    [_homePageCell contentScrollViewAddSubView:self.americaVC.view];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ZGHomePageHorizontalTopViewHeight;
    }
    
    return [UIScreen mainScreen].bounds.size.height - 64.0 - 44.0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"topView";
        cell.backgroundColor = [UIColor purpleColor];
        return cell;

    }else if (indexPath.section == 1){
        return self.homePageCell;
    }
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.tabSegmentView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 44;
}


#pragma mark - ZGTabSegmentViewDelegate
- (void)tabSegmentView:(ZGTabSegmentView *)segment didSelectedIndex:(NSInteger)index
{
    if (index == 0) {
        [self.homePageCell.contentScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (index == 1){
         [self.homePageCell.contentScrollView setContentOffset:CGPointMake(self.homePageCell.contentScrollView.bounds.size.width, 0) animated:YES];
    }
}

#pragma mark - ZGHomePageHorizontalCell
- (void)homePageHorizontalCell:(ZGHomePageHorizontalCell *)cell didScrollToIndex:(NSInteger)index
{
    [self.tabSegmentView selectIndex:index];
}


#pragma mark - scrollview
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 隐藏导航栏
//    NSLog(@"contentOffset.Y %f",scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 0) {
//        self.navigationController.navigationBar.hidden = YES;
////        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
//    }else {
//        self.navigationController.navigationBar.hidden = NO;
//    }
    
    
    
    // 限制contentOffset 范围
//    NSLog(@"contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView == self.tableView) {
        if(self.tableView.contentOffset.y < -64.0)
        {
            ;
        }else if (self.tableView.contentOffset.y > ZGHomePageHorizontalTopViewHeight - 64.0){
            [self.tableView setContentOffset:CGPointMake(0, ZGHomePageHorizontalTopViewHeight - 64.0)];
        }
        
    }
}





@end
