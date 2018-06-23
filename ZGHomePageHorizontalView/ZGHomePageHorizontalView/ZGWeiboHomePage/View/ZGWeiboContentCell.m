//
//  ZGWeiboContentCell.m
//  ZGHomePageHorizontalView
//
//  Created by 徐宗根 on 2018/6/17.
//  Copyright © 2018年 Zong. All rights reserved.
//

#import "ZGWeiboContentCell.h"

CGFloat ZGWeiboTableHeaderViewHeight = 156;

@interface ZGWeiboContentCell () <UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger currentIndex;


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
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ZGWeiboContentCellHeight)];
    _contentScrollView.tag = 512;
    _contentScrollView.contentSize = CGSizeMake(2*_contentScrollView.bounds.size.width, _contentScrollView.bounds.size.height);
    _contentScrollView.backgroundColor = [UIColor blackColor];
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    _contentScrollView.bounces = NO;
    [self.contentView addSubview:_contentScrollView];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.dragging || scrollView.decelerating) {
        NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
        if (index != self.currentIndex) {
            self.currentIndex = index;
            if (self.delegate && [self.delegate respondsToSelector:@selector(weiboContentCell:didScrollToIndex:)]) {
                [self.delegate weiboContentCell:self didScrollToIndex:self.currentIndex];
            }
        }
    }
}

@end
