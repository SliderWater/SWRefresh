//
//  SWTestViewController.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/25.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "SWTestViewController.h"

@interface SWTestViewController ()

@end

@implementation SWTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"测试用控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.presentingViewController) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
