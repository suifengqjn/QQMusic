//
//  Loric.h
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Loric : NSObject
///  这行歌词的内容
@property (nonatomic, copy) NSString *content;
///  这行歌词开始的时间
@property (nonatomic, assign) NSTimeInterval time;
@end
