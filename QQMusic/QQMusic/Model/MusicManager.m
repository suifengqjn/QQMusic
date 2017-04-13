//
//  MusicManager.m
//  QQMusic
//
//  Created by qianjn on 2017/4/11.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "MusicManager.h"

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

-(NSArray *)getAllMusics
{
    NSMutableArray *musicArr = [NSMutableArray array];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mlist" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    for (NSDictionary *m in array) {
        Music *music = [Music new];
        [music setValuesForKeysWithDictionary:m];
        [musicArr addObject:music];
    }
    return musicArr;
    
}
@end
