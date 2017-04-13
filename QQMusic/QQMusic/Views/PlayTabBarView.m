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
    
    self = [super initWithFrame:CGRectMake(0, kScreenHeight - Bar_Height, kScreenWidth, Bar_Height)];
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
    _currentTimeLabel.frame = CGRectMake(0, 0, 60, 40);
    _currentTimeLabel.text = @"00:00";
    [_topView addSubview:_currentTimeLabel];
    _currentTimeLabel.backgroundColor = [UIColor blueColor];
    
    _slider = [[UISlider alloc] init];
    _slider.frame = CGRectMake(60, 0, self.width - 60*2, 40);
    _slider.minimumTrackTintColor = [UIColor colorWithRGB:0x2DB969 alpha:1];
    _slider.maximumTrackTintColor = [UIColor grayColor];
    [_topView addSubview:_slider];
    
    _totalTimeLabel = [self createTimeLabel];
    _totalTimeLabel.frame = CGRectMake(self.width - 60, 0, 60, 40);
    _totalTimeLabel.text = @"00:00";
    [_topView addSubview:_totalTimeLabel];
    _totalTimeLabel.backgroundColor = [UIColor blueColor];
    
    
    
    
    
    
    //bottom
    _bottomView = [[UIView alloc] init];
    _bottomView.frame = CGRectMake(0, _topView.height, kScreenWidth, Bar_Height - _topView.height);
    _bottomView.backgroundColor = [UIColor grayColor];
    [self addSubview:_bottomView];
    
    _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_lastBtn setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [_lastBtn setImage:[UIImage imageNamed:@"player_btn_pre_highlight"] forState:UIControlStateHighlighted];
    _lastBtn.origin = CGPointMake(10, 10);
    [_bottomView addSubview:_lastBtn];
    
    
}


- (UILabel *)createTimeLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
