//
//  PlayController.m
//  QQMusic
//
//  Created by qianjn on 2017/4/13.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "PlayController.h"
#import "PlayTabBarView.h"

@interface PlayController () <PlayTabBarViewDelegate>

@property (nonatomic, strong) PlayTabBarView *barView;
@property (nonatomic, strong) UIScrollView *scrollow;
@property (nonatomic, strong) UIImageView *rotateImageView;
@property (nonatomic, strong) UIView *LoricView;

@property (nonatomic, strong) NSTimer *timer;
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
    [self buildContentView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)buildNav
{
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"return" style:UIBarButtonItemStyleDone target:self action:@selector(go_back)];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.title = self.music.name;
    
    //设置一张空的图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
    //[self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}

// 添加背景高斯模糊
- (void)buildCover
{
    UIImageView *backImageView = [[UIImageView alloc] init];
    backImageView.image = [UIImage imageNamed:self.music.image];
    backImageView.frame = self.view.bounds;
    [self.view addSubview:backImageView];
    
    
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEffectView.frame = backImageView.bounds;
    visualEffectView.alpha = 0.8;
    [backImageView addSubview:visualEffectView];
}

//旋转图片 和 歌词显示
- (void)buildContentView
{
    _scrollow = [[UIScrollView alloc] init];
    _scrollow.frame = CGRectMake(0,  64, kScreenWidth, kScreenHeight - 64 - _barView.height);
    //_scrollow.backgroundColor = [UIColor blueColor];
    _scrollow.pagingEnabled = YES;
    _scrollow.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:_scrollow];
    
    _rotateImageView = [[UIImageView alloc] init];
    _rotateImageView.userInteractionEnabled = YES;
    _rotateImageView.frame = CGRectMake(0, (_scrollow.height - _scrollow.width)/2, _scrollow.width, _scrollow.width);
    _rotateImageView.layer.cornerRadius = _rotateImageView.width/2;
    _rotateImageView.clipsToBounds = YES;
    _rotateImageView.image = [UIImage imageNamed:self.music.image];
    [_scrollow addSubview:_rotateImageView];
    
    _LoricView = [[UIView alloc] init];
    _LoricView.frame = CGRectMake(_scrollow.width, (_scrollow.height - _scrollow.width)/2, _scrollow.width, _scrollow.width);
    [_scrollow addSubview:_LoricView];
    _scrollow.contentSize = CGSizeMake(_scrollow.width * 2, _scrollow.height);
    
    
    
    
    
}

- (void)buildBottomBar
{
    self.view.backgroundColor = [UIColor whiteColor];
    _barView = [[PlayTabBarView alloc] init];
    _barView.delegate = self;
    [self.view addSubview:_barView];
    [self.view bringSubviewToFront:_barView];
}

- (void)updateUI
{
    
}

#pragma mark - action
- (void)go_back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateProgress
{
    _rotateImageView.transform = CGAffineTransformRotate(_rotateImageView.transform, M_PI_4 * 0.01);
}

#pragma mark - PlayTabBarViewDelegate
- (void)goPreMusic
{
    
}

- (void)PlayPauseMusic
{
    
}

- (void)goNextMusic
{
    
}

@end
