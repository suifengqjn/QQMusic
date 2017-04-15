//
//  PlayController.m
//  QQMusic
//
//  Created by qianjn on 2017/4/13.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "PlayController.h"
#import "PlayTabBarView.h"

@interface PlayController ()

@property (nonatomic, strong) PlayTabBarView *barView;

@end

@implementation PlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

#pragma mark - view
- (void)buildUI
{
    [self buildNav];
    [self buildCover];
    [self buildBottomBar];
    
}

- (void)buildNav
{
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"return" style:UIBarButtonItemStyleDone target:self action:@selector(go_back)];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.title = self.music.name;
}

// 添加背景高斯模糊
- (void)buildCover
{
    
}

- (void)buildBottomBar
{
    self.view.backgroundColor = [UIColor whiteColor];
    _barView = [[PlayTabBarView alloc] init];
    [self.view addSubview:_barView];
}
#pragma mark - action
- (void)go_back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
