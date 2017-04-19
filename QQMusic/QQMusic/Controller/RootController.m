//
//  RootController.m
//  QQMusic
//
//  Created by qianjn on 2017/3/29.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "RootController.h"
#import "MusicManager.h"
#import "PlayController.h"
@interface RootController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"QQ Music";
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.frame = self.view.bounds;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    [self getMusicList];
}

#pragma mark - data
- (void)getMusicList
{
    
    [_tableView reloadData];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [MusicManager getInstance].musicLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Music *music = [[MusicManager getInstance].musicLists objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIden"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellIden"];
    }
    
    cell.textLabel.text = music.name;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayController *playVC = [PlayController new];
    Music *music = [[MusicManager getInstance].musicLists objectAtIndex:indexPath.row];
    [MusicManager getInstance].currentIndex = indexPath.row;
    playVC.music = music;
    UINavigationController *navPlay = [[UINavigationController alloc] initWithRootViewController:playVC];
    [self presentViewController:navPlay animated:YES completion:nil];
    
}

@end
