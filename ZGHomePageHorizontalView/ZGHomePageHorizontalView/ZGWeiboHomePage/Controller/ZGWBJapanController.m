//
//  ZGWBJapanController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWBJapanController.h"

@interface ZGWBJapanController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZGWBJapanController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews
{
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.showsVerticalScrollIndicator= NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ZGWeiboCellReusedId"];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - Table view data source

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
    cell.textLabel.text = [NSString stringWithFormat:@"Japan - %zd",indexPath.row];
    return cell;
    
}

@end
