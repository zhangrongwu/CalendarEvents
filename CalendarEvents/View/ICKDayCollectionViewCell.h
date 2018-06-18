//
//  ICKDayCollectionViewCell.h
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICKHoursView.h"
#import "ICKCalendarEvent.h"
@interface ICKDayCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)ICKHoursView *hoursView;

@property (nonatomic, strong)NSArray<ICKCalendarEvent *> *events;
@end
