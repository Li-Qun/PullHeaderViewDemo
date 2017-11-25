//
//  HFNavBarAphaView.h
//  MensesTracker
//
//  Created by HF on 2017/10/18.
//  Copyright © 2017年 huofar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFNavBarAphaView : UIView

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)setNavViewAlpha:(CGFloat)alpha;

@end
