//
//  CBTableView.m
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBTableView.h"
#import "CBNetworkHelper.h"

static NSInteger g_pageSize = 10;
static NSString *g_pageIndexKey = @"pageindex";
static NSString *g_pageSizeKey = @"pagesize";

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

- (void)initSelf
{
    //self.delegate = self;
    self.dataSource = self;
    
    _pageIndex = 0;
    _tableData = [NSMutableArray array];
    
    /*UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor whiteColor];
    self.tableFooterView = footerView;*/
}

#pragma mark - Setter
+ (void)setGlobalPageSize:(NSInteger)pageSize
{
    g_pageSize = pageSize;
}

+ (void)setGlobalPageIndexKey:(NSString *)key
{
    g_pageIndexKey = key;
}

+ (void)setGlobalPageSizeKey:(NSString *)key
{
    g_pageSizeKey = key;
}

- (void)setPageable:(BOOL)pageable
{
    _pageable = pageable;
    
    if(_pageable) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            _pageIndex = 0;
            [self.tableData removeAllObjects];
            [self requestDataFromServer];
        }];
        
        /*self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _pageIndex++;
            [self requestDataFromServer];
        }];*/
    }
}

- (void)setPageFooter
{
    if(_pageable && !self.mj_footer) {
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _pageIndex++;
            [self requestDataFromServer];
        }];
    }
}

#pragma mark - Public Methods
- (void)requestDataFromServer
{
    if(self.requestUrl) {
        [self.tableData removeAllObjects];
        
        NSMutableDictionary *finalParams = self.requestParams;
        if(self.pageable) {
            finalParams[g_pageIndexKey] = @(self.pageIndex);
            finalParams[g_pageSizeKey] = @(g_pageSize);
        }
        
        NSLog(@"%@", self.requestUrl);
        NSLog(@"%@", finalParams);
        
        [[CBNetworkHelper shareInstance] post:self.requestUrl parameters:finalParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if(self.custDelegate && [self.custDelegate respondsToSelector:@selector(handleResponseData:responseObject:)]) {
                [_tableData addObjectsFromArray:[self.custDelegate handleResponseData:self responseObject:responseObject]];
            }
            
            if([_tableData count] >= g_pageSize) {
                [self setPageFooter];
            } else {
                self.mj_footer = nil;
            }
            
            [self reloadData];
        } failed:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", error);
        } finally:^{
            if(self.mj_header) {
                [self.mj_header endRefreshing];
            }
            
            if(self.mj_footer) {
                [self.mj_footer endRefreshing];
            }
        }];
    } else {
        NSLog(@"无请求地址");
    }
    
    if(self.mj_header) {
        [self.mj_header endRefreshing];
    }
    
    if(self.mj_footer) {
        [self.mj_footer endRefreshing];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.custDelegate && [self.custDelegate respondsToSelector:@selector(tableView:custCellForRowAtIndexPath:)]) {
        return [self.custDelegate tableView:self custCellForRowAtIndexPath:indexPath];
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBTableViewCell"];
    return cell;
}

@end
