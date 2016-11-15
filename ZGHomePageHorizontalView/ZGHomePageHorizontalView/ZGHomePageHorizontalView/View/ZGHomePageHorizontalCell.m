//
//  ZGHomePageHorizontalCell.m
//  ZGHomePageHorizontalView
//
//  Created by Zong on 16/11/15.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGHomePageHorizontalCell.h"

@interface ZGHomePageHorizontalCell ()

@property (nonatomic, strong) NSMutableArray *subViewsArray;

@end

@implementation ZGHomePageHorizontalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    _contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.backgroundColor = [UIColor blackColor];
    _contentScrollView.pagingEnabled = YES;
    
    [self.contentView addSubview:_contentScrollView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _contentScrollView.frame = self.bounds;
    
    CGFloat width = _contentScrollView.bounds.size.width;
    _contentScrollView.contentSize = CGSizeMake(width * 2, 0);
    
    for (int i= 0;i<self.subViewsArray.count;i++) {
        UIView *subView = self.subViewsArray[i];
        subView.frame = CGRectMake(i * width, 0, width, _contentScrollView.bounds.size.height);
    }
    
}

- (void)contentScrollViewAddSubView:(UIView *)subView
{
    if (!subView) {
        return;
    }
    
    [self.contentScrollView addSubview:subView];
    [self.subViewsArray addObject:subView];
    
}

#pragma mark - getter
- (NSMutableArray *)subViewsArray
{
    if (!_subViewsArray) {
        _subViewsArray = [NSMutableArray array];
    }
    return _subViewsArray;
}



@end
