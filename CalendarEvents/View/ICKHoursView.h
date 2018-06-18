//
//  ICKHoursView.h
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//  添加在collectionviewcell上的全部时间轴

#import <UIKit/UIKit.h>
#import "ICKHourItemView.h"

#define HEIGHT_CELL_HOUR 100.
#define HEIGHT_CELL_MIN HEIGHT_CELL_HOUR/4.
#define MINUTES_PER_LABEL 60./4.

@interface ICKHoursView : UIView
@property (nonatomic, assign) CGFloat totalHeight;
@property (nonatomic, strong)NSMutableArray<ICKHourItemView *> *hourItems;
+(CGFloat)getHoursViewTotalHeight;
@end
