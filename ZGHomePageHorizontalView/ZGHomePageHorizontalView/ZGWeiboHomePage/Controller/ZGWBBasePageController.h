//
//  ZGWBBasePageController.h
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const ZGWeiboPageTableCanScrollNotify;
UIKIT_EXTERN NSString *const ZGWeiboTableCanScrollNotify;

@interface ZGWBBasePageController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@end
