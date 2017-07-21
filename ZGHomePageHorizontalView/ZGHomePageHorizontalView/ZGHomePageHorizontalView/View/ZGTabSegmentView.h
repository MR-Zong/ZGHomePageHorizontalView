//
//  MYQMessageTabSegmentView.h
//  MianYangQuan
//
//  Created by 徐宗根 on 2017/7/17.
//  Copyright © 2017年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat const ZGMessageTabSegmentViewHeight;

@class ZGTabSegmentView;

@protocol ZGTabSegmentViewDelegate  <NSObject>

- (void)tabSegmentView:(ZGTabSegmentView *)segment didSelectedIndex:(NSInteger)index;

@end



@interface ZGTabSegmentView : UIView

@property (nonatomic, weak) id <ZGTabSegmentViewDelegate> delegate;

- (void)selectIndex:(NSInteger)index;


@end


