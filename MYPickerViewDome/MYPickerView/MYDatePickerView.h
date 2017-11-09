//
//  MYDatePickerView.h
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYBaseView.h"

typedef void(^MYDateResultBlock)(NSString *selectValue);

@interface MYDatePickerView : MYBaseView




/**
 显示时间选择器

 @param title           标题
 @param defaultSelValue 默认选择时间 (为空 选择当前时间)
 @param minDateInfo     最小时间 (如：2015-08-28 00:00:00)
 @param maxDateInfo     最大时间
 @param isAutoSelect    是否自动选择滚动时间
 @param resultBlock     选择结果回调
 */
- (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)dateType
                defaultSelValue:(NSString *)defaultSelValue
                    minDateInfo:(NSString *)minDateInfo
                    maxDateInfo:(NSString *)maxDateInfo
                   isAutoSelect:(BOOL)isAutoSelect
                    resultBlock:(MYDateResultBlock)resultBlock;



/**
 显示时间选择器

 @param title           标题
 @param dateType        类型(时间.日期.日期和时间.倒计时)
 @param defaultSelValue 默认选择时间
 @param minDateInfo     最小时间
 @param maxDateInfo     最大时间
 @param isAutoSelect    是否自动选择滚动时间
 @param resultBlock     选择结果回调
 */
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)dateType
                defaultSelValue:(NSString *)defaultSelValue
                    minDateInfo:(NSString *)minDateInfo
                    maxDateInfo:(NSString *)maxDateInfo
                   isAutoSelect:(BOOL)isAutoSelect
                    resultBlock:(MYDateResultBlock)resultBlock;





@end
