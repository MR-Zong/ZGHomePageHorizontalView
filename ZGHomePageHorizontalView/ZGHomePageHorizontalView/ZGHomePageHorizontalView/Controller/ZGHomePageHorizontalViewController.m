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

float const ZGHomePageHorizontalTopViewHeight = 144.0;

@interface ZGHomePageHorizontalViewController ()

@property (nonatomic, strong) ZGHomePageHorizontalCell *homePageCell;
@property (nonatomic, strong) ZGJapanController *japanVC;
@property (nonatomic, strong) ZGAmericaController *americaVC;

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
    
    _japanVC = [[ZGJapanController alloc] init];
    _japanVC.containVC = self;
    _americaVC = [[ZGAmericaController alloc] init];
    _americaVC.containVC = self;
    
    
    _homePageCell = [[ZGHomePageHorizontalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homePageCellReuserdIDB"];
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
    
    if (indexPath.section == 1){
        return self.homePageCell;
    }else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homePageCellReuserdIDB"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homePageCellReuserdIDBB"];
        }
        cell.textLabel.text = @"topView";
        cell.backgroundColor = [UIColor purpleColor];
        return cell;
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] init];
    
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width / 2.0;
    CGFloat btnHeight = 44;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"Japan" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor orangeColor];
    btn1.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    [sectionHeaderView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"America" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor lightGrayColor];
    btn2.frame = CGRectMake(btnWidth, 0, btnWidth, btnHeight);
    [sectionHeaderView addSubview:btn2];
    
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 44;
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
