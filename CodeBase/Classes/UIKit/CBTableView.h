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

- (NSInteger)tableView:(CBTableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(CBTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CBTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) id<CBTableViewDelegate> custDelegate;
@property (strong, nonatomic) NSMutableArray *tableData;

@end
