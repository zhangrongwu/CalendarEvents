//
//  ICKHourItemView.h
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//  每一个时间轴0-23

#import <UIKit/UIKit.h>

@interface ICKHourItemView : UIView
@property (nonatomic, strong)NSDate *itemDate;
- (id)initWithFrame:(CGRect)frame date:(NSDate *)date;

@end
