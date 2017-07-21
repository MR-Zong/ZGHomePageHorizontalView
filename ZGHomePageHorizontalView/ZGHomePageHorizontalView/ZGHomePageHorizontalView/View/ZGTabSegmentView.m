//
//  MYQMessageTabSegmentView.m
//  MianYangQuan
//
//  Created by 徐宗根 on 2017/7/17.
//  Copyright © 2017年 kk. All rights reserved.
//

#import "ZGTabSegmentView.h"
#import "UIColor+DHUtil.h"

CGFloat const ZGMessageTabSegmentViewHeight = 44.0;

@interface ZGTabSegmentView ()

@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *likeEachOther;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIView *seperatorLineView;

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation ZGTabSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _messageButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_messageButton setTitle:@"Japan" forState:UIControlStateNormal];
    [_messageButton setTitleColor:[UIColor colorWithHex:0xe2e2e2] forState:UIControlStateNormal];
    [_messageButton setTitleColor:[UIColor colorWithHex:0x589bda] forState:UIControlStateSelected];
    [_messageButton addTarget:self action:@selector(didToucButton:) forControlEvents:UIControlEventTouchUpInside];
    _messageButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:_messageButton];
    
    _likeEachOther = [UIButton buttonWithType:UIButtonTypeCustom];
    _likeEachOther.tag = 1;
    _likeEachOther.titleLabel.font = [UIFont systemFontOfSize:14];
    [_likeEachOther setTitle:@"America" forState:UIControlStateNormal];
    [_likeEachOther setTitleColor:[UIColor colorWithHex:0xe2e2e2] forState:UIControlStateNormal];
    [_likeEachOther setTitleColor:[UIColor colorWithHex:0x589bda] forState:UIControlStateSelected];
    [_likeEachOther addTarget:self action:@selector(didToucButton:) forControlEvents:UIControlEventTouchUpInside];
    _likeEachOther.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_likeEachOther];
    
    _indicatorView  = [[UIView alloc] init];
    _indicatorView.backgroundColor = [UIColor colorWithHex:0x589bda];
    _indicatorView.layer.cornerRadius = 1;
    _indicatorView.layer.masksToBounds = YES;
    [self addSubview:_indicatorView];
    
    _seperatorLineView = [[UIView alloc] init];
    _seperatorLineView.backgroundColor = [UIColor colorWithHex:0x4b4b4b];
    _seperatorLineView.hidden = YES;
    [self addSubview:_seperatorLineView];
    
    // setup frame
    CGFloat btnWdith = self.bounds.size.width * 0.5;
    _messageButton.frame = CGRectMake(0, 0, btnWdith, self.bounds.size.height);
    _likeEachOther.frame = CGRectMake(btnWdith, 0, btnWdith, self.bounds.size.height);
    _indicatorView.frame = CGRectMake(_messageButton.frame.origin.x, 0, btnWdith, 2.0);
    _seperatorLineView.frame = CGRectMake(btnWdith, (self.bounds.size.height - 20) * 0.5, 1, 20);
    
    // 默认 选项
    _messageButton.selected = YES;
    self.selectedButton = _messageButton;
}


- (void)didToucButton:(UIButton *)btn
{
    [self didSelectButton:btn needScroll:YES];
}

- (void)selectIndex:(NSInteger)index
{
    UIButton *selectBtn;
    if (index == 0) {
        selectBtn = _messageButton;
    }else if (index == 1){
        selectBtn = _likeEachOther;
    }
    [self didSelectButton:selectBtn needScroll:NO];
}

- (void)didSelectButton:(UIButton *)btn needScroll:(BOOL)needScroll
{
    self.selectedButton.selected = NO;
    
    self.selectedButton = btn;
    
    self.selectedButton.selected = YES;
    
    
    CGRect tmpFrame = self.indicatorView.frame;
    tmpFrame.origin.x = self.selectedButton.frame.origin.x;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.frame = tmpFrame;
    }];
    
    if (needScroll == YES) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(tabSegmentView:didSelectedIndex:)]) {
            [self.delegate tabSegmentView:self didSelectedIndex:btn.tag];
        }
    }
}

@end
