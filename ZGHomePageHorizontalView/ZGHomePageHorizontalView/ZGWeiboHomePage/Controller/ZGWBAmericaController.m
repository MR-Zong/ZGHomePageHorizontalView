//
//  ZGWBAmericaController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWBAmericaController.h"

@interface ZGWBAmericaController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZGWBAmericaController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews
{
    self.tableView = [[ZGPageTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, ZGWeiboContentCellHeight)];
    self.tableView.showsVerticalScrollIndicator= NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ZGWeiboCellReusedId"];
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZGWeiboCellReusedId"];
    cell.textLabel.text = [NSString stringWithFormat:@"America - %zd",indexPath.row];
    return cell;
    
}

@end
