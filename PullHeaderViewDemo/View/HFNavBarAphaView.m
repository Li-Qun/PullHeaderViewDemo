//
//  HFNavBarAphaView.m
//  MensesTracker
//
//  Created by HF on 2017/10/18.
//  Copyright © 2017年 huofar. All rights reserved.
//

#import "HFNavBarAphaView.h"

@interface HFNavBarAphaView ()
{
    UIColor *whiteColor;
    UIColor *blackColor;
}


@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation HFNavBarAphaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        whiteColor = [UIColor whiteColor];
        blackColor = [UIColor blackColor];
        self.backgroundColor = [whiteColor colorWithAlphaComponent:0];
        
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.titleLabel];
        
        CGFloat statusBarHeight = statusBar_height;
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.width.equalTo(@44);
            make.height.equalTo(@44);
            make.top.equalTo(self).offset(statusBarHeight);
        }];
        [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(- 8);
            make.width.equalTo(@44);
            make.height.equalTo(@44);
            make.top.equalTo(self).offset(statusBarHeight);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftButton.mas_right).offset(5);
            make.right.equalTo(self.rightButton.mas_left).offset( - 5);
            make.top.equalTo(self).offset(statusBarHeight);
            make.bottom.equalTo(self);
        }];
        
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@(1 / YYScreenScale()));
            make.bottom.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - private

- (void)setNavViewAlpha:(CGFloat)alpha
{
    if (alpha < 0.5) alpha = 0;
    self.titleLabel.textColor = [blackColor colorWithAlphaComponent:alpha];
    
    if (alpha > 0.9) alpha = 1.0; //T4950  说是不透明 特此修改
    self.backgroundColor = [whiteColor colorWithAlphaComponent:alpha];
    self.bottomLine.alpha = alpha;
    
    if (alpha == 0) {
        [_leftButton setImage:[UIImage imageNamed:@"icon_round_back_highlight"] forState:UIControlStateHighlighted];
        [_rightButton setImage:[UIImage imageNamed:@"icon_round_share_highlight"] forState:UIControlStateHighlighted];
    } else {
        [_leftButton setImage:[UIImage imageNamed:@"icon_round_back_highlight"] forState:UIControlStateHighlighted];
        [_rightButton setImage:[UIImage imageNamed:@"分享icon"] forState:UIControlStateHighlighted];
    }
}

#pragma mark - getter and setter

- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"icon_round_back"] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:@"icon_round_back_highlight"] forState:UIControlStateHighlighted];
        
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setImage:[UIImage imageNamed:@"icon_round_share"] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"icon_round_share_highlight"] forState:UIControlStateHighlighted];
        
    }
    return _rightButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _titleLabel;
}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
    }
    return _bottomLine;
}

@end
