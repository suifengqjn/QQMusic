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
@property (nonatomic, strong) NSArray *dataArray;
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
    _dataArray = [[MusicManager getInstance] getAllMusics];
    [_tableView reloadData];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Music *music = [_dataArray objectAtIndex:indexPath.row];
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
    Music *music = [_dataArray objectAtIndex:indexPath.row];
    playVC.music = music;
    [self.navigationController pushViewController:playVC animated:YES];
    
}

@end
