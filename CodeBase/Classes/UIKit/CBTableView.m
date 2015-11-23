//
//  CBTableView.m
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBTableView.h"
#import "CBNetworkHelper.h"

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

#pragma mark - Public Methods
- (void)requestDataFromServer
{
    if(self.requestUrl) {
        NSMutableDictionary *finalParams = [self.requestParams mutableCopy];
        if(self.pageIndexKey) {
            finalParams[self.pageIndexKey] = @(self.pageIndex);
        }
        
        if(self.pageSizeKey) {
            if(self.pageSize > 0) {
                finalParams[self.pageSizeKey] = @(self.pageSize);
            } else {
                finalParams[self.pageSizeKey] = @(10);
            }
        }
        
        [[CBNetworkHelper shareInstance] post:self.requestUrl parameters:finalParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if(self.custDelegate && [self.custDelegate respondsToSelector:@selector(handleResponseData:)]) {
                [_tableData addObjectsFromArray:[self.custDelegate handleResponseData:responseObject]];
            }
            [self reloadData];
        } failed:^(AFHTTPRequestOperation *operation, NSError *error) {
        } finally:^{
            if(self.mj_header) {
                [self.mj_header endRefreshing];
            }
            
            if(self.mj_footer) {
                [self.mj_footer endRefreshing];
            }
        }];
    }
    
    NSLog(@"无请求地址");
    if(self.mj_header) {
        [self.mj_header endRefreshing];
    }
    
    if(self.mj_footer) {
        [self.mj_footer endRefreshing];
    }
}


#pragma mark - Private Methods
- (void)initSelf
{
    self.delegate = self;
    self.dataSource = self;
    _tableData = [NSMutableArray array];
    
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _pageIndex = 0;
        [self requestDataFromServer];
    }];
    
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _pageIndex++;
        [self requestDataFromServer];
    }];
    
    //[self.mj_header beginRefreshing];
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
