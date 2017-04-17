//
//  MusicManager.h
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Music.h"

typedef  NS_ENUM (NSInteger , MusicState) {
    MusicInit = 0,
    MusicPlaying,
    MusicPause
};


@protocol MusicManagerDelegate <NSObject>

- (void)musicStateChanged:(MusicState )state;

@end

@interface MusicManager : NSObject

@property (nonatomic, assign) MusicState state;
@property (nonatomic, weak) id <MusicManagerDelegate>delegate;
+(instancetype)getInstance;


-(NSArray *)getAllMusics;


- (void)playMusicWithFileName:(NSString *)fileName didComplete:(void (^)())complete;
- (void)PlayOrPause;


@end
