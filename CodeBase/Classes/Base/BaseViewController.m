//
//  BaseViewController.m
//  CodeBase
//
//  Created by leeqb on 11/8/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BaseController removeBackTitle:self.navigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
