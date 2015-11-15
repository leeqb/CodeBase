//
//  CBView.m
//  CodeBase
//
//  Created by leeqb on 11/15/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBView.h"

@implementation CBView

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
    
}

#pragma mark - Setter
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

@end
