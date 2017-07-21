//
//  MYQPageTableViewController.h
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2017/7/21.
//  Copyright © 2017年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGHomePageHorizontalViewController;

@interface ZGPageTableViewController : UITableViewController

- (instancetype)initWithContainVC:(ZGHomePageHorizontalViewController *)contianVC;

@property (nonatomic, weak) ZGHomePageHorizontalViewController *containVC;


@end
