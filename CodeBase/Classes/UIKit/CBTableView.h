//
//  CBTableView.h
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@class CBTableView;

@protocol CBTableViewDelegate <UITableViewDelegate>

@optional
- (NSArray *)handleResponseData:(id)responseObject;

@required
- (NSInteger)tableView:(CBTableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(CBTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CBTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) id<CBTableViewDelegate> custDelegate;

@property (readonly, nonatomic) NSMutableArray *tableData;
@property (readonly, nonatomic) NSInteger pageIndex;

@property (strong, nonatomic) NSString *requestUrl;
@property (strong, nonatomic) NSDictionary *requestParams;
@property (strong, nonatomic) NSString *pageIndexKey;
@property (strong, nonatomic) NSString *pageSizeKey;
@property (assign, nonatomic) NSInteger pageSize;

- (void)requestDataFromServer;

@end
