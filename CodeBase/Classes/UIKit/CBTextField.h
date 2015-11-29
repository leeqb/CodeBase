//
//  CBTextField.h
//  CodeBase
//
//  Created by leeqb on 11/29/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTextField : UITextField

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;

@end
