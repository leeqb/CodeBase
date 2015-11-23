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
- (UITableViewCell *)tableView:(CBTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CBTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) IBInspectable id<CBTableViewDelegate> custDelegate;
@property (readonly, nonatomic) NSMutableArray *tableData;
@property (assign, nonatomic) BOOL pageable;
@property (readonly, nonatomic) NSInteger pageIndex;
@property (strong, nonatomic) NSString *requestUrl;
@property (strong, nonatomic) NSDictionary *requestParams;

+ (void)setGlobalPageSize:(NSInteger)pageSize;
+ (void)setGlobalPageIndexKey:(NSString *)key;
+ (void)setGlobalPageSizeKey:(NSString *)key;

- (void)requestDataFromServer;

@end
