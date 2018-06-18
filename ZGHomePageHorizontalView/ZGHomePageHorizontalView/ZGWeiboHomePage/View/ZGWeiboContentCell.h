//
//  ZGWeiboContentCell.h
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat ZGWeiboHeaderViewHeight;

@class ZGWeiboContentCell;

@protocol ZGWeiboContentCellDelegate <NSObject>

- (void)weiboContentCell:(ZGWeiboContentCell *)cell didScrollToIndex:(NSInteger)index;

@end

@interface ZGWeiboContentCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) UITableView *curTableView;
@property (nonatomic, weak) id <ZGWeiboContentCellDelegate> delegate;

@end
