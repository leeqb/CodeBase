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

+ (nonnull instancetype)shareInstance;

- (void)showLoading:(nonnull NSString *)msg, ...;
- (void)showProcessing:(nonnull NSString *)msg, ...;
- (void)showSuccess:(nonnull NSString *)msg, ...;
- (void)showFailed:(nonnull NSString *)msg, ...;

@end
