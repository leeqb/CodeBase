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
- (NSArray *)handleResponseData:(CBTableView *)tableView responseObject:(id)responseObject;

@required
- (UITableViewCell *)tableView:(CBTableView *)tableView custCellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CBTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    BOOL _isLoading;
}

@property (assign, nonatomic) id<CBTableViewDelegate> custDelegate;
@property (readonly, nonatomic) NSMutableArray *tableData;
@property (assign, nonatomic) BOOL pageable;
@property (readonly, nonatomic) NSInteger pageIndex;
@property (strong, nonatomic) NSString *requestUrl;
@property (strong, nonatomic) NSMutableDictionary *requestParams;

+ (void)setGlobalPageSize:(NSInteger)pageSize;
+ (void)setGlobalPageIndexKey:(NSString *)key;
+ (void)setGlobalPageSizeKey:(NSString *)key;

- (void)requestDataFromServer;

@end
