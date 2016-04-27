//
//  LCStatusBarHUD.m
//  04-LCStatusBarHUD
//
//  Created by 林国超 on 16/4/27.
//  Copyright © 2016年 林国超. All rights reserved.
//

#import "LCStatusBarHUD.h"

#define LCMessageFont [UIFont systemFontOfSize:13]

/** 消息停留的时间 */
static CGFloat const LCMessageDuration=2.0;

static CGFloat const LCAnimationDuration=0.15;

@implementation LCStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;


/**
 *  初始化窗口
 */
+(void)setupWindow
{
    //frame数据
    CGFloat windowH=20;
    CGRect frame=CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示窗口
    window_.hidden=YES;
    window_=[[UIWindow alloc] init];
    window_.windowLevel=UIWindowLevelAlert;
    window_.backgroundColor=[UIColor lightGrayColor];
    window_.frame=frame;
    window_.hidden=NO;
    
    //动画
    frame.origin.y=0;
    [UIView animateWithDuration:LCAnimationDuration animations:^{
        window_.frame=frame;
    }];
}


+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    [self setupWindow];
    
    //添加按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.userInteractionEnabled=NO;
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font=LCMessageFont;
    if (image) {//如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    }

    button.frame=window_.bounds;
    [window_ addSubview:button];
    
    //定时器
    timer_ =[NSTimer scheduledTimerWithTimeInterval:LCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}


+(void)showSuccessWithStatus:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LCStatusBarHUD.bundle/check_tick"]];
}

+(void)showErrorWithStatus:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LCStatusBarHUD.bundle/Error"]];
}

+(void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_=nil;
    
    //显示窗口
    [self setupWindow];
    
    //添加文字
    UILabel *lable=[[UILabel alloc] init];
    lable.frame=window_.bounds;
    lable.font=LCMessageFont;
    lable.textAlignment=NSTextAlignmentCenter;
    lable.text=msg;
    lable.textColor=[UIColor whiteColor];
    [window_ addSubview:lable];
    
    //添加圈圈
    UIActivityIndicatorView *indicatorView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView startAnimating];
    //文字宽度
    CGFloat msgW=[msg sizeWithAttributes:@{NSFontAttributeName : LCMessageFont}].width;
    CGFloat centerX=(window_.frame.size.width-msgW)*0.5-20;
    CGFloat centerY=window_.frame.size.height*0.5;
    indicatorView.center=CGPointMake(centerX, centerY);
    [window_ addSubview:indicatorView];
}


+(void)hide
{
    [UIView animateWithDuration:LCAnimationDuration animations:^{
        CGRect frame=window_.frame;
        frame.origin.y=-frame.origin.y;
        window_.frame=frame;
    } completion:^(BOOL finished) {
        window_=nil;
        timer_=nil;
    }];
}

@end
