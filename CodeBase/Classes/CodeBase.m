//
//  CodeBase.m
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CodeBase.h"

@implementation CodeBase

+ (instancetype)shareInstance
{
    static CodeBase *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CodeBase new];
    });
    return instance;
}

- (void)initConfig:(NSString *)configName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:configName ofType:nil];
    _appConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
}

@end
