//
//  BaseController.m
//  CodeBase
//
//  Created by leeqb on 11/8/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "BaseController.h"

@implementation BaseController

+ (void)removeBackTitle:(UINavigationItem *)navItem
{
    UIBarButtonItem *newBackItem = [UIBarButtonItem new];
    navItem.backBarButtonItem = newBackItem;
    navItem.backBarButtonItem.title = @"";
}

@end
