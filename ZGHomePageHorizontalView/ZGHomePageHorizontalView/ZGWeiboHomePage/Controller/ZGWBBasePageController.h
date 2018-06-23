//
//  ZGWBBasePageController.h
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGPageTableView.h"

@class ZGWeiboContentCell;

UIKIT_EXTERN NSString *const ZGWeiboPageTableCanScrollNotify;
UIKIT_EXTERN NSString *const ZGWeiboTableCanScrollNotify;

@interface ZGWBBasePageController : UIViewController

@property (nonatomic, strong) ZGPageTableView *tableView;
@property (nonatomic, weak) ZGWeiboContentCell *contentCell;
@property (nonatomic, assign) BOOL canScroll;

@end
