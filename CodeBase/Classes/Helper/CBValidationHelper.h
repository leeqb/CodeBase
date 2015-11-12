//
//  CBValidationHelper.h
//  KCB
//
//  Created by leeqb on 11/1/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBValidationHelper : NSObject

+ (BOOL)isValidateEmail:(NSString *)Email;

+ (BOOL)validateMobile:(NSString *)mobileNum;

@end
