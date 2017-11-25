//
//  HFHeadView.h
//  PullHeaderViewDemo
//
//  Created by HF on 2017/11/25.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFHeadView : UIView

@property (nonatomic, strong) UIImageView *iconImageView;


/**
 根据frame 变化展示图片大小,UIViewContentModeScaleAspectFill 模式 保证图的比例正确并填充整个绘制区域

 @param frame frame
 */
- (void)updatePageImageViewFrame:(CGRect)frame;

@end
