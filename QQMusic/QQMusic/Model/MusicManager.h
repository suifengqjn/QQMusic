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

@interface MusicManager : NSObject

@property (nonatomic, assign) MusicState state;

+(instancetype)getInstance;


-(NSArray *)getAllMusics;

@end
