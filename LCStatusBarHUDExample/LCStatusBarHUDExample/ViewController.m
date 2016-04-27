//
//  ViewController.m
//  LCStatusBarHUDExample
//
//  Created by 林国超 on 16/4/27.
//  Copyright © 2016年 林国超. All rights reserved.
//

#import "ViewController.h"
#import "LCStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)success:(id)sender {
    [LCStatusBarHUD showSuccessWithStatus:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [LCStatusBarHUD showErrorWithStatus:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [LCStatusBarHUD showLoading:@"正在加载"];
}

- (IBAction)hide:(id)sender {
    [LCStatusBarHUD hide];
}

- (IBAction)normalWord:(id)sender {
    [LCStatusBarHUD showMessage:@"只是普通文字,没有图片"];
}

@end
