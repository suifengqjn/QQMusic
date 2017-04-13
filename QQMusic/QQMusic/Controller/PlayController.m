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

- (void)buildUI
{
    self.title = self.music.name;
    self.view.backgroundColor = [UIColor whiteColor];
    _barView = [[PlayTabBarView alloc] init];
    [self.view addSubview:_barView];
}

@end
