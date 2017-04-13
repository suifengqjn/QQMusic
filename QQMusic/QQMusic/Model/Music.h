//
//  Music.h
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject
///  专辑图片
@property (nonatomic, copy) NSString *image;
///  歌词文件
@property (nonatomic, copy) NSString *lrc;
///  歌曲文件
@property (nonatomic, copy) NSString *mp3;
///  歌曲名
@property (nonatomic, copy) NSString *name;
///  歌手
@property (nonatomic, copy) NSString *singer;
///  专辑名称
@property (nonatomic, copy) NSString *album;

@end
