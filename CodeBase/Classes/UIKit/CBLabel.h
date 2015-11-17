//
//  CBLabel.h
//  CodeBase
//
//  Created by leeqb on 11/18/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBLabel : UILabel

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;

@end
