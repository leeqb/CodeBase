//
//  CBBaseController.m
//  CodeBase
//
//  Created by leeqb on 11/8/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBBaseController.h"

@implementation CBBaseController

+ (void)removeBackTitle:(UIViewController *)vc
{
    UIBarButtonItem *newBackItem = [UIBarButtonItem new];
    vc.navigationItem.backBarButtonItem = newBackItem;
    vc.navigationItem.backBarButtonItem.title = @"";
}

@end
