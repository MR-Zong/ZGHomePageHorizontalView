//
//  ZGWeiboHomePageController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/10.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWeiboHomePageController.h"
#import "ZGWeiboTableView.h"
#import "ZGWeiboContentCell.h"
#import "ZGTabSegmentView.h"
#import "ZGWBJapanController.h"
#import "ZGWBAmericaController.h"


@interface ZGWeiboHomePageController () <UITableViewDelegate,UITableViewDataSource,ZGTabSegmentViewDelegate,ZGWeiboContentCellDelegate>

@property (nonatomic, strong) ZGWeiboTableView *tableView;
@property (nonatomic, strong) ZGWeiboContentCell *contentCell;
@property (nonatomic, strong) ZGTabSegmentView *tabSegmentView;
@property (nonatomic, assign) BOOL canScroll;


@end

@implementation ZGWeiboHomePageController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCanScroll) name:ZGWeiboTableCanScrollNotify object:nil];
    
    [self initialize];
    [self setupViews];
}

- (void)initialize
{
    self.title = @"个人主页";
    _canScroll = YES;
}


- (void)setupViews
{
    
    _tabSegmentView = [[ZGTabSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44.0)];
    _tabSegmentView.delegate = self;

    _tableView = [[ZGWeiboTableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor greenColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[ZGWeiboContentCell class] forCellReuseIdentifier:@"ZGWeiboContentCellReusedId"];
    [self.view addSubview:_tableView];
    
    _contentCell = [_tableView dequeueReusableCellWithIdentifier:@"ZGWeiboContentCellReusedId"];
    _contentCell.delegate = self;
    
    ZGWBJapanController *jVC = [[ZGWBJapanController alloc] init];
    jVC.view.frame = CGRectMake(0, 0, _contentCell.contentScrollView.bounds.size.width, _contentCell.contentScrollView.bounds.size.height);
    [_contentCell.contentScrollView addSubview:jVC.view];
    [self addChildViewController:jVC];
    
    
    ZGWBAmericaController *aVC = [[ZGWBAmericaController alloc] init];
    aVC.view.frame = CGRectMake(_contentCell.contentScrollView.bounds.size.width, 0, _contentCell.contentScrollView.bounds.size.width, _contentCell.contentScrollView.bounds.size.height);
    [_contentCell.contentScrollView addSubview:aVC.view];
    [self addChildViewController:aVC];
    
    _contentCell.curTableView = jVC.tableView;
    
    _tableView.contentCell = _contentCell;


    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 156)];
    header.backgroundColor = [UIColor purpleColor];
    _tableView.tableHeaderView = header;
}


#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableView.bounds.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.tabSegmentView;
}

#pragma mark - ZGTabSegmentViewDelegate
- (void)tabSegmentView:(ZGTabSegmentView *)segment didSelectedIndex:(NSInteger)index
{
    if (index == 0) {
        [self.contentCell.contentScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (index == 1){
        [self.contentCell.contentScrollView setContentOffset:CGPointMake(self.contentCell.contentScrollView.bounds.size.width, 0) animated:YES];
    }
}
#pragma mark - ZGWeiboContentCellDelegate
- (void)weiboContentCell:(ZGWeiboContentCell *)cell didScrollToIndex:(NSInteger)index
{
    [self.tabSegmentView selectIndex:index];
}


#pragma mark - scrollview

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 限制contentOffset 范围
    //    NSLog(@"contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView == self.tableView) {

        if (scrollView.contentOffset.y >= ZGWeiboHeaderViewHeight - 64.0){ // 这里是限制 非常重要
            
            // 自己不能滚动
            self.canScroll = NO;
            [scrollView setContentOffset:CGPointMake(0, ZGWeiboHeaderViewHeight - 64.0)];
            
            // 通知 pageTable 可以 滚动
//            NSLog(@"ffffffffffffffff");
            // pageTable 可以滚动
            [[NSNotificationCenter defaultCenter] postNotificationName:ZGWeiboPageTableCanScrollNotify object:nil];
            
        }else {
            if (!self.canScroll) {
                [scrollView setContentOffset:CGPointMake(0, ZGWeiboHeaderViewHeight - 64.0)];
            }
        }
        
    }
}


#pragma mark - notify
- (void)didCanScroll
{
    self.canScroll = YES;
}


@end
