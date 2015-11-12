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

- (void)startWithConfig:(NSString *)configFileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:configFileName ofType:nil];
    NSDictionary *configDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@", configDict);
}

@end
