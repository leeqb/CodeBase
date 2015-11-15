//
//  CBView.h
//  CodeBase
//
//  Created by leeqb on 11/15/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBView : UIView

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;

@end
