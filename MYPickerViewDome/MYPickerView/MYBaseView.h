//
//  MYBaseView.h
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

//
#define kDatePicHeight 200
#define kTopViewHeight 44

// 屏幕尺度  
#define kMAINSCREEN_Bounds  [UIScreen mainScreen].bounds
#define kMAINSCREEN_Width   [UIScreen mainScreen].bounds.size.width
#define kMAINSCREEN_Height  [UIScreen mainScreen].bounds.size.height

// RGB颜色(16进制)
#define RGB_HEX(rgbValue, a) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((CGFloat)(rgbValue & 0xFF)) / 255.0 alpha:(a)]

@interface MYBaseView : UIView
// 背景视图
@property (nonatomic, strong) UIView *myBaseViewBV;
// 展示视图
@property (nonatomic, strong) UIView *myBaseShowView;
// 顶部视图
@property (nonatomic, strong) UIView *myShowTopView;
// 左取消按钮
@property (nonatomic, strong) UIButton *myShowCancelBtn;
// 右确认按钮
@property (nonatomic, strong) UIButton *myShowConfirmBtn;
// 中间标题
@property (nonatomic, strong) UILabel *myShowTitleLabel;
// 分割线
@property (nonatomic, strong) UIView *myShowSepLine;


/**
 初始化视图
 */
- (void)my_initView;

/**
 点击背景遮罩图层事件

 @param sender 点击手势
 */
- (void)my_didTapBackgroundView:(UITapGestureRecognizer *)sender;

/**
 点击取消按钮事件
 */
- (void)my_didClickCancelBtnAction;

/**
 点击确认按钮事件
 */
- (void)my_didClickConfirmBtnAction;


@end
