//
//  MusicManager.h
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Music.h"
@interface MusicManager : NSObject

+(instancetype)getInstance;

-(NSArray *)getAllMusics;

@end
