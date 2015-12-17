//
//  CodeBase.h
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Base.h"

#import "UITableView+Extension.h"
#import "UITableViewCell+Extension.h"

#import "CBValidationHelper.h"
#import "CBNetworkHelper.h"

#import "CBAlertView.h"
#import "CBMessage.h"
#import "CBView.h"
#import "CBTableView.h"
#import "CBButton.h"
#import "CBTextField.h"
#import "CBLabel.h"
#import "CBCountDownButton.h"

#import "CBBaseModel.h"
#import "CBBaseController.h"
#import "CBBaseViewController.h"
#import "CBBaseTableViewController.h"

@interface CodeBase : NSObject

@property (strong, nonatomic) NSDictionary *appConfig;

+ (instancetype)shareInstance;

- (void)initConfig:(NSString *)configName;

@end
