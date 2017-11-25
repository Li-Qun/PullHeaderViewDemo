//
//  ViewController.m
//  PullHeaderViewDemo
//
//  Created by HF on 2017/11/25.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "ViewController.h"
#import "HFHeadView.h"
#import "HFNavBarAphaView.h"


@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) HFNavBarAphaView *navBarAphaView;
@property (nonatomic, strong) HFHeadView *headView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - action

#pragma mark - event response

- (void)backAction:(id)sender
{
    NSLog(@"返回按钮");
}

- (void)shareAction:(id)sender
{
    NSLog(@"分享");
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGFloat yOffset = scrollView.contentOffset.y+scrollView.contentInset.top;
        float originHeight = self.headView.height;
        
        if (yOffset < 0 ){
            float width = scrollView.width;
            float resizeScale = - (scrollView.contentOffset.y)/originHeight;
            CGRect frame = CGRectMake(0 - (width * resizeScale / 2),
                                      yOffset,
                                      round(width + width * resizeScale),
                                      round(originHeight + originHeight * resizeScale));
            
            [self.headView updatePageImageViewFrame:frame];
        }
        //导航颜色变化
        CGFloat offsetY = yOffset;
        if (offsetY > originHeight) {
            CGFloat alpha = MIN(1,1 - ((originHeight - offsetY) / originHeight));
            [self.navBarAphaView setNavViewAlpha:alpha];
        } else {
            [self.navBarAphaView setNavViewAlpha:0];
        }
    }
}

#pragma mark - private

- (void)initViews
{
    //tableView
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.tableView setTableHeaderView:self.headView];
    //custom nav
    [self.view addSubview:self.navBarAphaView];
    [self.navBarAphaView.titleLabel setText:@"list详情"];
    [self.navBarAphaView setNavViewAlpha:0];
    //调整
    //防止顶端留出状态栏高度空白
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark - getter and setter

- (HFNavBarAphaView *)navBarAphaView
{
    if (!_navBarAphaView) {
        _navBarAphaView = [[HFNavBarAphaView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, statusBar_height + 44)];
        [_navBarAphaView.leftButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [_navBarAphaView.rightButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navBarAphaView;
}

- (HFHeadView *)headView
{
    if (!_headView) {
        _headView = [[HFHeadView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 210)];
    }
    return _headView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
