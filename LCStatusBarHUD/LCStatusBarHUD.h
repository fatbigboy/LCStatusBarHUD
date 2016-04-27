//
//  LCStatusBarHUD.h
//  04-LCStatusBarHUD
//
//  Created by 林国超 on 16/4/27.
//  Copyright © 2016年 林国超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCStatusBarHUD : NSObject
/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+(void)showSuccessWithStatus:(NSString *)msg;

/**
 *  显示失败信息
 */
+(void)showErrorWithStatus:(NSString *)msg;

/**
 *  显示正在处理的信息
 */
+(void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+(void)hide;

@end
