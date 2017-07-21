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


@end
