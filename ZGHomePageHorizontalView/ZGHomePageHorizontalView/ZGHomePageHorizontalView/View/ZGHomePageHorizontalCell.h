//
//  ZGHomePageHorizontalCell.h
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *ZGHomePageHorizontalCellReusedID;

@class ZGHomePageHorizontalCell;

@protocol ZGHomePageHorizontalCellDelegate <NSObject>

- (void)homePageHorizontalCell:(ZGHomePageHorizontalCell *)cell didScrollToIndex:(NSInteger)index;

@end

@interface ZGHomePageHorizontalCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *contentScrollView;

- (void)contentScrollViewAddSubView:(UIView *)subView;

@property (nonatomic, weak) id <ZGHomePageHorizontalCellDelegate> delegate;

@end
