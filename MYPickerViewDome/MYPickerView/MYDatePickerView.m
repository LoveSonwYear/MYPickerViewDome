//
//  MYDatePickerView.m
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYDatePickerView.h"

@interface MYDatePickerView () {
    // 时间类型
    UIDatePickerMode _datePickerMode;
    // 显示标题
    NSString *_title;
    // 最小时间
    NSString *_minDateTime;
    // 最大时间
    NSString *_maxDateTime;
    // 回调
    MYDateResultBlock _resultBlock;
    // 默认时间
    NSString *_selectValue;
    // 是否开启自动选择
    BOOL _isAutoSelect;
}

// 时间选择器 (默认大小:320px * 216px)
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation MYDatePickerView

+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)dateType
                defaultSelValue:(NSString *)defaultSelValue
                    minDateInfo:(NSString *)minDateInfo
                    maxDateInfo:(NSString *)maxDateInfo
                   isAutoSelect:(BOOL)isAutoSelect
                    resultBlock:(MYDateResultBlock)resultBlock {
    
    MYDatePickerView *datePickerView = [[MYDatePickerView alloc] initWithTitle:title dateType:dateType defaultSelValue:defaultSelValue minDateStr:minDateInfo maxDateStr:maxDateInfo isAutoSelect:isAutoSelect resultBlock:resultBlock];
    [datePickerView showPickerViewWithAnimation:YES];
}

- (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)dateType
                defaultSelValue:(NSString *)defaultSelValue
                    minDateInfo:(NSString *)minDateInfo
                    maxDateInfo:(NSString *)maxDateInfo
                   isAutoSelect:(BOOL)isAutoSelect
                    resultBlock:(MYDateResultBlock)resultBlock {
    
//    [self initWithTitle:title dateType:dateType defaultSelValue:defaultSelValue minDateStr:minDateInfo maxDateStr:maxDateInfo isAutoSelect:isAutoSelect resultBlock:resultBlock];
//    [self showPickerViewWithAnimation:YES];
}



#pragma mark - 初始化时间选择器
- (instancetype)initWithTitle:(NSString *)title
                     dateType:(UIDatePickerMode)dateType
              defaultSelValue:(NSString *)defaultSelValue
                   minDateStr:(NSString *)minDateStr
                   maxDateStr:(NSString *)maxDateStr
                 isAutoSelect:(BOOL)isAutoSelect
                  resultBlock:(MYDateResultBlock)resultBlock {
    
    if (self = [super init]) {
        _title = title;
        _datePickerMode = dateType;
        _minDateTime    = minDateStr;
        _maxDateTime    = maxDateStr;
        _isAutoSelect   = isAutoSelect;
        _resultBlock    = resultBlock;
        
        // 设置默认选中时间
        if (defaultSelValue.length > 0) {
            _selectValue = defaultSelValue;
        } else {
            // 当前时间
            _selectValue = [self toStringWithDate:[NSDate date]];
        }
    }
    return self;
}

#pragma mark - 初始化子视图
- (void)my_initView {
    [super my_initView];
    // 标题
    self.myShowTitleLabel.text = _title;
    // 添加时间选择器
    [self.myBaseShowView addSubview:self.datePicker];
}

#pragma mark - 点击背景视图事假
- (void)my_didTapBackgroundView:(UITapGestureRecognizer *)sender {
    [self dismissWithAnimation:NO];
}

#pragma mark - 弹出视图
- (void)showPickerViewWithAnimation:(BOOL)animation {
    // 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (animation) {
        // 动画前初始位置
        CGRect rect = self.myBaseShowView.frame;
        rect.origin.y = kMAINSCREEN_Height;
        self.myBaseShowView.frame = rect;
        // 显示动画
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.myBaseShowView.frame;
            rect.origin.y -= kDatePicHeight + kTopViewHeight;
            self.myBaseShowView.frame = rect;
        }];
    }
}

#pragma mark - 关闭视图
- (void)dismissWithAnimation:(BOOL)animation {
    // 关闭动画
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.myBaseShowView.frame;
        rect.origin.y += kDatePicHeight + kTopViewHeight;
        self.myBaseShowView.frame = rect;
        self.myBaseViewBV.alpha = 0;
    } completion:^(BOOL finished) {
        // 全部移除
        [self.myShowCancelBtn removeFromSuperview];
        [self.myShowConfirmBtn removeFromSuperview];
        [self.myShowTitleLabel removeFromSuperview];
        [self.myShowSepLine removeFromSuperview];
        [self.myShowTopView removeFromSuperview];
        [self.datePicker removeFromSuperview];
        [self.myBaseShowView removeFromSuperview];
        [self.myBaseViewBV removeFromSuperview];
        [self removeFromSuperview];
        // 置为nil
        self.myShowCancelBtn  = nil;
        self.myShowConfirmBtn = nil;
        self.myShowTitleLabel = nil;
        self.myShowSepLine    = nil;
        self.myShowTopView    = nil;
        self.datePicker       = nil;
        self.myBaseShowView   = nil;
        self.myBaseViewBV     = nil;
    }];
}

#pragma mark - 时间选择器响应事件
- (void)didSelectValueChanged:(UIDatePicker *)sender {
    // 读取datePicker.date
    _selectValue = [self toStringWithDate:sender.date];
    NSLog(@"滚动完成后,执行block回调 %@",_selectValue);
    // 设置是否开启自动回调
    if (_isAutoSelect) {
        if (_resultBlock) {
            _resultBlock(_selectValue);
        }
    }
}

#pragma mark - 取消按钮点击事件
- (void)my_didClickCancelBtnAction {
    [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮点击事件
- (void)my_didClickConfirmBtnAction {
    NSLog(@"点击确定按钮后,执行block回调");
    [self dismissWithAnimation:YES];
    if (_resultBlock) {
        _resultBlock(_selectValue);
    }
}

#pragma mark - lazy
// 时间选择器
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0, kTopViewHeight + 0.5, kMAINSCREEN_Width, kDatePicHeight);
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = _datePickerMode;
        // 设置该UIDatePicker的国际化Locale，以简体中文习惯显示日期，UIDatePicker控件默认使用iOS系统的国际化Locale
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CHS_CN"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // 设置时间范围
        if (_minDateTime) {
            NSDate *minDate = [dateFormatter dateFromString:_minDateTime];
            _datePicker.minimumDate = minDate;
        }
        if (_maxDateTime) {
            NSDate *maxDate = [dateFormatter dateFromString:_maxDateTime];
            _datePicker.maximumDate = maxDate;
        }
        // 设置pickerView显示当前时间
        [_datePicker setDate:[NSDate date] animated:YES];
        // 滚动pickerView响应事件
        [_datePicker addTarget:self action:@selector(didSelectValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}



#pragma mark - 转换时间格式
- (NSString *)toStringWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (_datePickerMode) {
        case UIDatePickerModeTime: {
            [dateFormatter setDateFormat:@"HH:mm"];
        }
            break;
        case UIDatePickerModeDate: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
            break;
        case UIDatePickerModeDateAndTime: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
            break;
        case UIDatePickerModeCountDownTimer: {
            [dateFormatter setDateFormat:@"HH:mm"];
        }
            break;
        default:
            break;
    }
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}







@end
