//
//  PlayTabBarView.h
//  QQMusic
//
//  Created by qianjn on 2017/4/13.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayTabBarViewDelegate <NSObject>

- (void)goPreMusic;
- (void)PlayPauseMusic;
- (void)goNextMusic;

@end

@interface PlayTabBarView : UIView
@property (nonatomic, weak) id <PlayTabBarViewDelegate> delegate;

- (void)UpdateUIWithPlaying:(BOOL)playing;
@end
