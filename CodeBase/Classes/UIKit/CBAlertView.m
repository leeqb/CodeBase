//
//  CBAlertView.m
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBAlertView.h"

typedef void(^AlertBlock)(NSInteger *buttonIndex);

@implementation CBAlertView
{
    AlertBlock _alertBlock;
}

+ (CBAlertView *)shareInstance
{
    static CBAlertView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CBAlertView new];
    });
    return instance;
}

- (void)showMsg:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@end
