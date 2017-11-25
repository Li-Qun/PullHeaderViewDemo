//
//  HFHeadView.m
//  PullHeaderViewDemo
//
//  Created by HF on 2017/11/25.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "HFHeadView.h"

@implementation HFHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

#pragma mark - public

- (void)updatePageImageViewFrame:(CGRect)frame
{
    CGFloat totalOffset = self.height + ABS(frame.origin.y);
    self.iconImageView.width = frame.size.width;
    self.iconImageView.height = totalOffset;
    self.iconImageView.left = frame.origin.x;
    self.iconImageView.top = frame.origin.y;
}

#pragma mark - private

- (void)configSubViews
{
    [self addSubview:self.iconImageView];
    self.iconImageView.frame = self.frame;//这里不使用约束 iOS11以后有 拉伸时候适配bug
}

#pragma mark - getter and setter

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:
                          [UIImage imageNamed:@"icon_head.jpg"]];
        _iconImageView.clipsToBounds = YES;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconImageView;
}

@end
