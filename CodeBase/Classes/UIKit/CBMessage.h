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

+ (CBMessage *)shareInstance;

- (void)showLoading:(NSString *)msg,...;
- (void)showProcessing:(NSString *)msg,...;
- (void)showSuccess:(NSString *)msg,...;
- (void)showFailed:(NSString *)msg,...;

@end
