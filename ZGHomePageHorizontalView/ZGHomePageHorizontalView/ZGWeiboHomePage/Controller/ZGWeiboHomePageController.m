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


@interface ZGWeiboHomePageController () <UITableViewDelegate,UITableViewDataSource,ZGTabSegmentViewDelegate>

@property (nonatomic, strong) ZGWeiboTableView *tableView;
@property (nonatomic, strong) ZGWeiboContentCell *contentCell;
@property (nonatomic, strong) ZGTabSegmentView *tabSegmentView;


@end

@implementation ZGWeiboHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
    [self setupViews];
}

- (void)initialize
{
    self.title = @"个人主页";
}


- (void)setupViews
{
    
    _tabSegmentView = [[ZGTabSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44.0)];
    _tabSegmentView.delegate = self;

    _tableView = [[ZGWeiboTableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor greenColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[ZGWeiboContentCell class] forCellReuseIdentifier:@"ZGWeiboContentCellReusedId"];
    [self.view addSubview:_tableView];
    
    _contentCell = [_tableView dequeueReusableCellWithIdentifier:@"ZGWeiboContentCellReusedId"];

    ZGWBJapanController *jVC = [[ZGWBJapanController alloc] init];
    jVC.view.frame = CGRectMake(0, 0, _contentCell.contentScrollView.bounds.size.width, _contentCell.contentScrollView.bounds.size.height);
    [_contentCell.contentScrollView addSubview:jVC.view];
    [self addChildViewController:jVC];
    
    
    ZGWBAmericaController *aVC = [[ZGWBAmericaController alloc] init];
    aVC.view.frame = CGRectMake(_contentCell.contentScrollView.bounds.size.width, 0, _contentCell.contentScrollView.bounds.size.width, _contentCell.contentScrollView.bounds.size.height);
    [_contentCell.contentScrollView addSubview:aVC.view];
    [self addChildViewController:aVC];

    
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
    return self.tableView.bounds.size.height - 200;
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


@end
