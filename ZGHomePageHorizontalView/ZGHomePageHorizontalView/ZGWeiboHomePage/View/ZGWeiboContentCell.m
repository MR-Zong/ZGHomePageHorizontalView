//
//  ZGWeiboContentCell.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWeiboContentCell.h"

@interface ZGWeiboContentCell ()


@end


@implementation ZGWeiboContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200)];
    _contentScrollView.contentSize = CGSizeMake(2*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200);
    _contentScrollView.backgroundColor = [UIColor blackColor];
    _contentScrollView.pagingEnabled = YES;
    [self.contentView addSubview:_contentScrollView];
    
}

@end
