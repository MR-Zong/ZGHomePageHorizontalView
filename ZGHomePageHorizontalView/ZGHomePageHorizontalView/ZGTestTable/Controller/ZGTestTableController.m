//
//  ZGTestTableController.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/18.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGTestTableController.h"

@interface ZGTestTableController () <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation ZGTestTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"测试";
    [self setupViews];
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //    _tableView.contentInset = UIEdgeInsetsMake(0, 0, -10,0);
    _tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_tableView];
    
    _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    _maskView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_maskView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    pan.delegate = self;
    [_maskView addGestureRecognizer:pan];
}

- (void)setupViews
{
    [self setupTableView];
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

#pragma mark - UIGestureRecognizerDelegate

/////允许同时识别多个手势
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}


#pragma mark - pan
- (void)didPan:(UIPanGestureRecognizer *)pan
{
    NSLog(@"pan ");
    
    // 实践证明 通过handlePan: 来传递 手势 是不可行的!
    [self.tableView performSelector:@selector(handlePan:) withObject:pan];
}

@end
