//
//  PlayTabBarView.m
//  QQMusic
//
//  Created by qianjn on 2017/4/13.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "PlayTabBarView.h"

#define Bar_Height 104

@interface PlayTabBarView ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *currentTimeLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *totalTimeLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *nextBtn;


@end

@implementation PlayTabBarView


- (instancetype)init
{
    
    self = [super initWithFrame:CGRectMake(0, kScreenHeight - Bar_Height - 10, kScreenWidth, Bar_Height)];
    if (self) {
        [self buildUI];
    }
    return self;
}

#pragma mark - View
- (void)buildUI
{
    
    //top
    _topView = [[UIView alloc] init];
    _topView.frame = CGRectMake(0, 0, self.width, 40);
    [self addSubview:_topView];
    
    _currentTimeLabel = [self createTimeLabel];
    _currentTimeLabel.frame = CGRectMake(0, 5, 60, 40);
    _currentTimeLabel.text = @"00:00";
    [_topView addSubview:_currentTimeLabel];
    
    _slider = [[UISlider alloc] init];
    _slider.frame = CGRectMake(60, 5, self.width - 60*2, 40);
    _slider.minimumTrackTintColor = [UIColor colorWithRGB:0x2DB969 alpha:1];
    _slider.maximumTrackTintColor = [UIColor grayColor];
    [_topView addSubview:_slider];
    
    _totalTimeLabel = [self createTimeLabel];
    _totalTimeLabel.frame = CGRectMake(self.width - 60, 5, 60, 40);
    _totalTimeLabel.text = @"00:00";
    [_topView addSubview:_totalTimeLabel];
    
    
    
    //bottom
    _bottomView = [[UIView alloc] init];
    _bottomView.frame = CGRectMake(0, _topView.height, kScreenWidth, Bar_Height - _topView.height);
    [self addSubview:_bottomView];
    
    _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_lastBtn addTarget:self action:@selector(clickPreMusic) forControlEvents:UIControlEventTouchUpInside];
    [_lastBtn setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [_lastBtn setImage:[UIImage imageNamed:@"player_btn_pre_highlight"] forState:UIControlStateHighlighted];
    [_lastBtn sizeToFit];
    _lastBtn.x = 20;
    [_bottomView addSubview:_lastBtn];
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playBtn addTarget:self action:@selector(clickPlayMusic) forControlEvents:UIControlEventTouchUpInside];
    [_playBtn setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
    [_playBtn setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateHighlighted];
    [_playBtn sizeToFit];
    _playBtn.centerX = self.width/2;
    [_bottomView addSubview:_playBtn];
    
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nextBtn addTarget:self action:@selector(clickNextMusic) forControlEvents:UIControlEventTouchUpInside];
    [_nextBtn setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
    [_nextBtn setImage:[UIImage imageNamed:@"player_btn_next_highlight"] forState:UIControlStateHighlighted];
    [_nextBtn sizeToFit];
    _nextBtn.x = self.width - 20 - _nextBtn.width;
    [_bottomView addSubview:_nextBtn];

    
}


- (UILabel *)createTimeLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

#pragma mark - public action
- (void)UpdateUIWithPlaying:(BOOL)playing
{
    if (playing) {
        [_playBtn setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    } else {
        [_playBtn setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateHighlighted];
    }
}

#pragma mark - delegate action

- (void)clickPreMusic
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goPreMusic)]) {
        [self.delegate goPreMusic];
    }
}

- (void)clickPlayMusic
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goPlayPauseMusic)]) {
        [self.delegate goPlayPauseMusic];
    }
    
}

- (void)clickNextMusic
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goNextMusic)]) {
        [self.delegate goNextMusic];
    }
}
@end
