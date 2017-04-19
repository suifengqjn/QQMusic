//
//  MusicManager.m
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "MusicManager.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicManager ()<AVAudioPlayerDelegate>

@property (nonatomic, strong, readwrite) NSMutableArray *musicLists;

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) void(^complete)();

@end

@implementation MusicManager
+(instancetype)getInstance
{
    static MusicManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MusicManager alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *musicArr = [NSMutableArray array];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mlist" ofType:@"plist"];
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
        for (NSDictionary *m in array) {
            Music *music = [Music new];
            [music setValuesForKeysWithDictionary:m];
            [musicArr addObject:music];
        }
        _musicLists = musicArr;
    }
    return self;
}

- (void)playMusicWithFileName:(NSString *)fileName didComplete:(void (^)())complete
{
    if (fileName && ![fileName isEqualToString:self.fileName]) {
        NSURL *musicUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicUrl error:nil];
        self.player.delegate = self;
        [self.player prepareToPlay];
        
        self.fileName = fileName;
        self.complete = complete;
        self.state = MusicInit;
    }
    
    [self Play];
}


- (void)Play
{
    self.state = MusicPlaying;
    [self.player play];
}
- (void)Pause
{
    self.state = MusicPause;
    [self.player pause];
}

- (void)setState:(MusicState)state
{
    if (_state != state) {
        _state = state;
        if (self.delegate && [self.delegate respondsToSelector:@selector(musicStateChanged:)]) {
            [self.delegate musicStateChanged:_state];
        }
    }
}

- (Music *)previousMusic
{
    NSInteger pre = _currentIndex - 1;
    if (pre < 0) {
        _currentIndex = 0;
        return _musicLists.lastObject;
        
    } else {
        _currentIndex -= 1;
        return [_musicLists objectAtIndex:pre];
    }
}

- (Music *)nextMusic
{
    NSInteger next = _currentIndex + 1;
    if (next > _musicLists.count - 1) {
        _currentIndex = _musicLists.count - 1;
        return _musicLists.lastObject;
    } else {
        _currentIndex += 1;
        return [_musicLists objectAtIndex:next];
    }
    
}

#pragma mark 代理方法
///  当歌曲播放完毕后调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    // 回调
    self.complete();
}
@end
