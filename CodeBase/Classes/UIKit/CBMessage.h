//
//  CBMessage.h
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGProgressHUD.h"

@interface CBMessage : UIResponder

+ (instancetype)shareInstance;

- (void)showLoading;
- (void)showProcessing;
- (void)showSuccess;
- (void)showFailed;
- (void)dismiss;

@end
