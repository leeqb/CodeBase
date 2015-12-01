//
//  CBMessage.m
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBMessage.h"

@implementation CBMessage
{
    JGProgressHUD *_hud;
}

+ (instancetype)shareInstance
{
    static CBMessage *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CBMessage new];
    });
    return instance;
}

- (NSArray *)parseArgs:(id)args, ...
{
    NSMutableArray *argsArray = [NSMutableArray array];
    va_list params; //定义一个指向个数可变的参数列表指针;
    va_start(params,args);//va_start 得到第一个可变参数地址,
    id arg;
    if (args) {
        //将第一个参数添加到array
        id prev = args;
        [argsArray addObject:prev];
        //va_arg 指向下一个参数地址
        //这里是问题的所在 网上的例子，没有保存第一个参数地址，后边循环，指针将不会在指向第一个参数
        while( (arg = va_arg(params,id)) )
        {
            if ( arg ){
                [argsArray addObject:arg];  
            }  
        }  
        //置空  
        va_end(params);
    }
    
    return argsArray;
}

- (void)showLoading
{
    [self dismiss];
    _hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    _hud.textLabel.text = @"加载中...";
    [_hud showInView:[UIApplication sharedApplication].keyWindow animated:YES];
}

- (void)showProcessing
{
    [self dismiss];
    _hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    _hud.textLabel.text = @"处理中...";
    [_hud showInView:[UIApplication sharedApplication].keyWindow animated:YES];
}

- (void)showSuccess
{
    [self dismiss];
    _hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    _hud.textLabel.text = @"操作成功";
    [_hud showInView:[UIApplication sharedApplication].keyWindow animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

- (void)showFailed
{
    [self dismiss];
    _hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    _hud.textLabel.text = @"操作失败";
    [_hud showInView:[UIApplication sharedApplication].keyWindow animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

- (void)dismiss
{
    [_hud dismiss];
}

@end
