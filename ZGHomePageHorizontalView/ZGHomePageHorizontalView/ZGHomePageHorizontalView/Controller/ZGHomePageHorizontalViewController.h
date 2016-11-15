//
//  ZGHomePageViewController.h
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN float const ZGHomePageHorizontalTopViewHeight;

@interface ZGHomePageHorizontalViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
