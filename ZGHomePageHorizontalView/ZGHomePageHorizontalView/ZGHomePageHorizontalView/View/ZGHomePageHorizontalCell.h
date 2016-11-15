//
//  ZGHomePageHorizontalCell.h
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGHomePageHorizontalCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *contentScrollView;

- (void)contentScrollViewAddSubView:(UIView *)subView;

@end
