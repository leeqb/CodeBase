//
//  CBTextField.m
//  CodeBase
//
//  Created by leeqb on 11/29/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBTextField.h"

@implementation CBTextField

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
