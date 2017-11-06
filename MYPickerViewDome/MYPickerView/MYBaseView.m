//
//  MYBaseView.m
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYBaseView.h"


@implementation MYBaseView

- (void)my_initView {
    self.frame = kMAINSCREEN_Bounds;
    // 背景图层
    [self addSubview:self.myBaseViewBV];
    // 展示视图
    [self addSubview:self.myBaseShowView];
    // 设置显示视图子视图
    // 顶部工具视图
    [self.myBaseShowView addSubview:self.myShowTopView];
    // 取消按钮
    [self.myShowTopView addSubview:self.myShowCancelBtn];
    // 确认按钮
    [self.myShowTopView addSubview:self.myShowConfirmBtn];
    // 提示标题
    [self.myShowTopView addSubview:self.myShowTitleLabel];
    // 分割线
    [self.myShowTopView addSubview:self.myShowSepLine];
}

#pragma mark - tapGesture Action - 背景点击事件
- (void)my_didTapBackgroundView:(UITapGestureRecognizer *)sender {
    
}

#pragma mark - 取消点击事件
- (void)my_didClickCancelBtnAction {
    
}

#pragma mark - 确认点击事件
- (void)my_didClickConfirmBtnAction {
    
}



#pragma mark - lazy
// 背景遮罩视图
- (UIView *)myBaseViewBV {
    if (!_myBaseViewBV) {
        _myBaseViewBV = [[UIView alloc] init];
        _myBaseViewBV.frame = kMAINSCREEN_Bounds;
        _myBaseViewBV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.20f];
        UITapGestureRecognizer *backViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(my_didTapBackgroundView:)];
        [_myBaseViewBV addGestureRecognizer:backViewTap];
    }
    return _myBaseViewBV;
}

// 展示视图
- (UIView *)myBaseShowView {
    if (!_myBaseShowView) {
        _myBaseShowView = [[UIView alloc] init];
        _myBaseShowView.frame = CGRectMake(0, kMAINSCREEN_Height - kDatePicHeight - kTopViewHeight, kMAINSCREEN_Width, kDatePicHeight + kTopViewHeight);
        _myBaseShowView.backgroundColor = [UIColor whiteColor];
    }
    return _myBaseShowView;
}

// 顶部工具视图
- (UIView *)myShowTopView {
    if (!_myShowTopView) {
        _myShowTopView = [[UIView alloc] init];
        _myShowTopView.frame = CGRectMake(0, 0, kMAINSCREEN_Width, kTopViewHeight + 0.5);
        _myShowTopView.backgroundColor = RGB_HEX(0xFDFDFD, 1.0f);
    }
    return _myShowTopView;
}

// 取消按钮
- (UIButton *)myShowCancelBtn {
    if (!_myShowCancelBtn) {
        _myShowCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _myShowCancelBtn.frame = CGRectMake(5, 8, 60, 28);
        _myShowCancelBtn.backgroundColor     = [UIColor clearColor];
        _myShowCancelBtn.layer.cornerRadius  = 6.f;
        _myShowCancelBtn.layer.masksToBounds = YES;
        _myShowCancelBtn.layer.borderWidth   = 1.f;
        _myShowCancelBtn.layer.borderColor   = RGB_HEX(0xFF7998, 1).CGColor;
        [_myShowCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_myShowCancelBtn setTitleColor:RGB_HEX(0xFF7998, 1) forState:UIControlStateNormal];
        _myShowCancelBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [_myShowCancelBtn addTarget:self action:@selector(my_didClickCancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myShowCancelBtn;
}

// 确定按钮
- (UIButton *)myShowConfirmBtn {
    if (!_myShowConfirmBtn) {
        _myShowConfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _myShowConfirmBtn.frame = CGRectMake(kMAINSCREEN_Width - 65, 8, 60, 28);
        _myShowConfirmBtn.backgroundColor     = [UIColor clearColor];
        _myShowConfirmBtn.layer.cornerRadius  = 6.f;
        _myShowConfirmBtn.layer.masksToBounds = YES;
        _myShowConfirmBtn.layer.borderWidth   = 1.f;
        _myShowConfirmBtn.layer.borderColor   = RGB_HEX(0xFF7998, 1).CGColor;
        [_myShowConfirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_myShowConfirmBtn setTitleColor:RGB_HEX(0xFF7998, 1) forState:UIControlStateNormal];
        _myShowConfirmBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [_myShowConfirmBtn addTarget:self action:@selector(my_didClickConfirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myShowConfirmBtn;
}

// 提示标题
- (UILabel *)myShowTitleLabel {
    if (!_myShowTitleLabel) {
        _myShowTitleLabel = [[UILabel alloc] init];
        _myShowTitleLabel.frame = CGRectMake(65, 0, kMAINSCREEN_Width - 130, kTopViewHeight);
        _myShowTitleLabel.font = [UIFont systemFontOfSize:14.f];
        _myShowTitleLabel.textColor = RGB_HEX(0xFF7998, 1.f);
        _myShowTitleLabel.textAlignment = NSTextAlignmentCenter;
        _myShowTitleLabel.backgroundColor = [UIColor clearColor];
    }
    return _myShowTitleLabel;
}

// 分割线
- (UIView *)myShowSepLine {
    if (!_myShowSepLine) {
        _myShowSepLine = [[UIView alloc] init];
        _myShowSepLine.frame = CGRectMake(0, kTopViewHeight, kMAINSCREEN_Width, 0.5);
        _myShowSepLine.backgroundColor = RGB_HEX(0xE1E1E1, 1.f);
    }
    return _myShowSepLine;
}


@end
