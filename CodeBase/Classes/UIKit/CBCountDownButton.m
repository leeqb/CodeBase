//
//  CBCountDownButton.m
//  CodeBase
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBCountDownButton.h"

@implementation CBCountDownButton
{
    NSTimer *_timer;
    UIColor *_originalBgColor;
    NSString *_originalTitle;
    
    NSInteger _totalSeconds;
    NSInteger _leftSeconds;
}

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf
{
    _originalTitle = self.titleLabel.text;
    _originalBgColor = self.backgroundColor;
}

- (void)startCountDown:(NSInteger)seconds
{
    _totalSeconds = seconds;
    self.enabled = NO;
    self.backgroundColor = [UIColor lightGrayColor];
    
    if(_totalSeconds > 0) {
        _leftSeconds = _totalSeconds;
        [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", (long)_leftSeconds] forState:UIControlStateNormal];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    }
}

- (void)timerHandle
{
    _leftSeconds--;
    [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", (long)_leftSeconds] forState:UIControlStateNormal];
    
    if(_leftSeconds <= 0) {
        [self setTitle:_originalTitle forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
        
        self.enabled = YES;
        self.backgroundColor = _originalBgColor;
    }
}

@end
