//
//  CBAlertView.h
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBAlertView : UIAlertView<UIAlertViewDelegate>

+ (CBAlertView *)shareInstance;

- (void)showMsg:(NSString *)msg;

@end
