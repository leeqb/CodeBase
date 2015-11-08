//
//  CBTableView.m
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBTableView.h"

@implementation CBTableView

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initSelf];
    }
    return self;
}

#pragma mark - Private Methods
- (void)initSelf
{
    self.delegate = self;
    self.dataSource = self;
    _tableData = [NSMutableArray array];
    
    self.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    }];
    
    self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
    }];
    
    [self.header beginRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.custDelegate && [self.custDelegate respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [self.custDelegate tableView:self numberOfRowsInSection:section];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.custDelegate && [self.custDelegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        return [self.custDelegate tableView:self cellForRowAtIndexPath:indexPath];
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBTableViewCell"];
    return cell;
}

@end
